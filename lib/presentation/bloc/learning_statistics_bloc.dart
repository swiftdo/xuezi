import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/learning_record.dart';
import '../../domain/repositories/learning_record_repository.dart';

part 'learning_statistics_bloc.freezed.dart';

@freezed
class LearningStatisticsEvent with _$LearningStatisticsEvent {
  const factory LearningStatisticsEvent.started(String planId) = _Started;
  const factory LearningStatisticsEvent.refresh() = _Refresh;
}

@freezed
class LearningStatisticsState with _$LearningStatisticsState {
  const factory LearningStatisticsState.initial() = _Initial;
  const factory LearningStatisticsState.loading() = _Loading;
  const factory LearningStatisticsState.error(String message) = _Error;
  const factory LearningStatisticsState.loaded({
    required List<LearningRecord> records,
    required Map<String, int> masteryCount,
  }) = _Loaded;
}

class LearningStatisticsBloc
    extends Bloc<LearningStatisticsEvent, LearningStatisticsState> {
  final LearningRecordRepository _repository;
  String? _currentPlanId;

  LearningStatisticsBloc(this._repository)
      : super(const LearningStatisticsState.initial()) {
    on<LearningStatisticsEvent>((event, emit) async {
      await event.map(
        started: (e) async => await _onStarted(e, emit),
        refresh: (e) async => await _onRefresh(e, emit),
      );
    });
  }

  Future<void> _onStarted(
      _Started event, Emitter<LearningStatisticsState> emit) async {
    emit(const LearningStatisticsState.loading());
    _currentPlanId = event.planId;
    await _loadStatistics(emit);
  }

  Future<void> _onRefresh(
      _Refresh event, Emitter<LearningStatisticsState> emit) async {
    if (_currentPlanId == null) {
      emit(const LearningStatisticsState.error('No plan selected'));
      return;
    }
    emit(const LearningStatisticsState.loading());
    await _loadStatistics(emit);
  }

  Future<void> _loadStatistics(Emitter<LearningStatisticsState> emit) async {
    try {
      final records = await _repository.getLearningRecords(_currentPlanId!);
      final masteryCount =
          await _repository.getCharacterMasteryCount(_currentPlanId!);
      emit(LearningStatisticsState.loaded(
        records: records,
        masteryCount: masteryCount,
      ));
    } catch (e) {
      emit(LearningStatisticsState.error(e.toString()));
    }
  }
}
