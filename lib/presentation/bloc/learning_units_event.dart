part of 'learning_units_bloc.dart';

@freezed
class LearningUnitsEvent with _$LearningUnitsEvent {
  const factory LearningUnitsEvent.started() = _Started;
  const factory LearningUnitsEvent.progressUpdated({
    required String unitId,
    required double progress,
  }) = _ProgressUpdated;
}
