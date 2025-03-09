import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/learning_plan.dart';
import '../../domain/entities/learning_record.dart';
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
    on<_CharacterUndone>(_onCharacterUndone);
    on<_EndSession>(_onEndSession);
    on<_Restart>(_onRestart);
  }

  static List<String> _getCharactersForPlan(LearningPlan plan) {
    // 从示例数据中获取字符
    final allCharacters = SampleLearningData.basicUnits
        .expand((unit) => unit.groups)
        .expand((group) => group.characters)
        .map((char) => char.character)
        .toList();

    // 根据计划的目标数量返回字符
    return allCharacters.take(plan.targetCharactersPerDay).toList();
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

  void _onCharacterLearned(
      _CharacterLearned event, Emitter<LearningSessionState> emit) {
    // Create new lists to ensure immutability
    final List<String> newKnownCharacters = [...state.knownCharacters];
    final List<String> newUnknownCharacters = [...state.unknownCharacters];

    // Remove the character from both lists first to avoid duplicates
    newKnownCharacters.remove(event.character);
    newUnknownCharacters.remove(event.character);

    // Add to appropriate list based on isKnown flag
    if (event.isKnown) {
      newKnownCharacters.add(event.character);
    } else {
      newUnknownCharacters.add(event.character);
    }

    // Create a completely new state object
    final newState = LearningSessionState(
      plan: state.plan,
      startTime: state.startTime,
      totalStudyTime: state.totalStudyTime,
      charactersLearned:
          newKnownCharacters.length + newUnknownCharacters.length,
      isActive: state.isActive,
      completedExercises: [...state.completedExercises],
      knownCharacters: newKnownCharacters,
      unknownCharacters: newUnknownCharacters,
      characters: [...state.characters],
      lastResumeTime: state.lastResumeTime,
    );

    emit(newState);
  }

  void _onCharacterUndone(
      _CharacterUndone event, Emitter<LearningSessionState> emit) {
    // Create new lists to ensure immutability
    final List<String> newKnownCharacters = [...state.knownCharacters];
    final List<String> newUnknownCharacters = [...state.unknownCharacters];

    // Remove the character from both lists
    newKnownCharacters.remove(event.character);
    newUnknownCharacters.remove(event.character);

    // Create a completely new state object
    final newState = LearningSessionState(
      plan: state.plan,
      startTime: state.startTime,
      totalStudyTime: state.totalStudyTime,
      charactersLearned:
          newKnownCharacters.length + newUnknownCharacters.length,
      isActive: state.isActive,
      completedExercises: [...state.completedExercises],
      knownCharacters: newKnownCharacters,
      unknownCharacters: newUnknownCharacters,
      characters: [...state.characters],
      lastResumeTime: state.lastResumeTime,
    );

    emit(newState);
  }

  Future<void> _onEndSession(
      _EndSession event, Emitter<LearningSessionState> emit) async {
    final now = DateTime.now();
    final totalTime = state.isActive
        ? state.totalStudyTime + now.difference(state.lastResumeTime!)
        : state.totalStudyTime;

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

    emit(state.copyWith(
      isActive: false,
      totalStudyTime: totalTime,
      lastResumeTime: null,
    ));
  }

  void _onRestart(_Restart event, Emitter<LearningSessionState> emit) {
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
