part of 'learning_units_bloc.dart';

class UnitWithProgress {
  final LearningUnit unit;
  final double progress;

  const UnitWithProgress({
    required this.unit,
    required this.progress,
  });
}

@freezed
class LearningUnitsState with _$LearningUnitsState {
  const factory LearningUnitsState.initial() = _Initial;
  const factory LearningUnitsState.loading() = _Loading;
  const factory LearningUnitsState.loaded(List<UnitWithProgress> units) =
      _Loaded;
  const factory LearningUnitsState.error(String message) = _Error;
}
