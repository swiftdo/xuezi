import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/learning_plan.dart';
import '../../domain/entities/learning_record.dart';
import '../../domain/entities/review_character.dart';
import '../../domain/repositories/learning_record_repository.dart';
import '../../data/sample_learning_data.dart';

part 'learning_session_bloc.freezed.dart';
part 'learning_session_event.dart';
part 'learning_session_state.dart';

class LearningSessionBloc
    extends Bloc<LearningSessionEvent, LearningSessionState> {
  final LearningPlan plan;
  final LearningRecordRepository _repository;
  final List<String> _characters;
  final _uuid = const Uuid();
  final Map<String, ReviewCharacter> _reviewCharacterCache = {};

  LearningSessionBloc(this.plan, this._repository)
      : _characters = _getCharactersForPlan(plan),
        super(LearningSessionState(
          plan: plan,
          startTime: DateTime.now(),
          lastResumeTime: DateTime.now(),
          totalStudyTime: Duration.zero,
          charactersLearned: 0,
          isActive: true,
          completedExercises: [],
          knownCharacters: [],
          unknownCharacters: [],
          characters: _getCharactersForPlan(plan),
        )) {
    on<_Started>(_onStarted);
    on<_Paused>(_onPaused);
    on<_Resumed>(_onResumed);
    on<_CharacterLearned>(_onCharacterLearned);
    on<_EndSession>(_onEndSession);
    on<_Restart>(_onRestart);
  }

  static List<String> _getCharactersForPlan(LearningPlan plan) {
    // 从示例数据中获取字符，使用缓存优化性能
    final cachedCharacters = SampleLearningData.basicUnits
        .expand((unit) => unit.groups)
        .expand((group) => group.characters)
        .map((char) => char.character)
        .toList();

    // 根据计划的目标数量返回字符
    return cachedCharacters.take(plan.targetCharactersPerDay).toList();
  }

  void _onStarted(_Started event, Emitter<LearningSessionState> emit) {
    // 初始化学习会话
    emit(state.copyWith(
      startTime: DateTime.now(),
      lastResumeTime: DateTime.now(),
      isActive: true,
    ));
  }

  void _onPaused(_Paused event, Emitter<LearningSessionState> emit) {
    if (state.isActive) {
      final now = DateTime.now();
      final additionalTime = now.difference(state.lastResumeTime!);
      emit(state.copyWith(
        isActive: false,
        totalStudyTime: state.totalStudyTime + additionalTime,
        lastResumeTime: null,
      ));
    }
  }

  void _onResumed(_Resumed event, Emitter<LearningSessionState> emit) {
    if (!state.isActive) {
      emit(state.copyWith(
        isActive: true,
        lastResumeTime: DateTime.now(),
      ));
    }
  }

  Future<void> _onCharacterLearned(
    _CharacterLearned event,
    Emitter<LearningSessionState> emit,
  ) async {
    final now = DateTime.now();
    final character = event.character;
    final isKnown = event.isKnown;

    // 批量更新状态
    final List<String> newKnownCharacters = List.from(state.knownCharacters);
    final List<String> newUnknownCharacters =
        List.from(state.unknownCharacters);

    if (isKnown) {
      newKnownCharacters.add(character);
    } else {
      newUnknownCharacters.add(character);
    }

    // 更新状态
    emit(state.copyWith(
      charactersLearned: state.charactersLearned + 1,
      knownCharacters: newKnownCharacters,
      unknownCharacters: newUnknownCharacters,
    ));

    // 异步保存记录
    _saveRecordsAsync(
      character: character,
      isKnown: isKnown,
      now: now,
      knownCharacters: newKnownCharacters,
      unknownCharacters: newUnknownCharacters,
    );
  }

  Future<void> _saveRecordsAsync({
    required String character,
    required bool isKnown,
    required DateTime now,
    required List<String> knownCharacters,
    required List<String> unknownCharacters,
  }) async {
    try {
      // Create and save learning record
      final record = LearningRecord(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        planId: state.plan.id,
        startTime: state.startTime,
        endTime: now,
        totalStudyTime: state.totalStudyTime,
        knownCharacters: knownCharacters,
        unknownCharacters: unknownCharacters,
        targetCharactersPerDay: state.plan.targetCharactersPerDay,
        targetStudyTimePerDay: state.plan.targetStudyTimePerDay,
      );
      await _repository.saveLearningRecord(record);

      // Create or update review character
      final reviewChar = ReviewCharacter(
        character: character,
        learnedAt: now,
        reviewDates: [now],
        reviewCount: 0,
        needsReview: !isKnown,
        nextReviewDate: ReviewCharacter.calculateNextReviewDate(now, 0),
      );
      _reviewCharacterCache[character] = reviewChar;
      await _repository.saveReviewCharacter(reviewChar);
    } catch (e) {
      // 错误处理
      print('Error saving records: $e');
    }
  }

  Future<void> _onEndSession(
      _EndSession event, Emitter<LearningSessionState> emit) async {
    final now = DateTime.now();
    final totalTime = state.isActive
        ? state.totalStudyTime + now.difference(state.lastResumeTime!)
        : state.totalStudyTime;

    emit(state.copyWith(
      isActive: false,
      totalStudyTime: totalTime,
      lastResumeTime: null,
    ));

    // 异步保存会话记录
    _saveSessionRecordsAsync(now, totalTime);
  }

  Future<void> _saveSessionRecordsAsync(
      DateTime now, Duration totalTime) async {
    try {
      // Create learning record
      final record = LearningRecord(
        id: _uuid.v4(),
        planId: plan.id,
        startTime: state.startTime,
        endTime: now,
        totalStudyTime: totalTime,
        knownCharacters: state.knownCharacters,
        unknownCharacters: state.unknownCharacters,
        targetCharactersPerDay: plan.targetCharactersPerDay,
        targetStudyTimePerDay: plan.targetStudyTimePerDay,
      );

      await _repository.saveLearningRecord(record);

      // Create review records for known characters
      for (final character in state.knownCharacters) {
        if (!_reviewCharacterCache.containsKey(character)) {
          final reviewCharacter = ReviewCharacter(
            character: character,
            learnedAt: now,
            reviewDates: [],
            reviewCount: 0,
            needsReview: true,
            nextReviewDate: ReviewCharacter.calculateNextReviewDate(now, 0),
          );
          _reviewCharacterCache[character] = reviewCharacter;
          await _repository.saveReviewCharacter(reviewCharacter);
        }
      }
    } catch (e) {
      print('Error saving session records: $e');
    }
  }

  void _onRestart(_Restart event, Emitter<LearningSessionState> emit) {
    _reviewCharacterCache.clear();
    emit(LearningSessionState(
      plan: plan,
      startTime: DateTime.now(),
      lastResumeTime: DateTime.now(),
      totalStudyTime: Duration.zero,
      charactersLearned: 0,
      isActive: true,
      completedExercises: [],
      knownCharacters: [],
      unknownCharacters: [],
      characters: _characters,
    ));
  }
}
