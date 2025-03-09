part of 'learning_statistics_bloc.dart';

@freezed
class LearningStatisticsState with _$LearningStatisticsState {
  const factory LearningStatisticsState.initial() = _Initial;
  const factory LearningStatisticsState.loading() = _Loading;
  const factory LearningStatisticsState.error(String message) = _Error;
  const factory LearningStatisticsState.loaded({
    required Duration totalStudyTime,
    required Map<String, int> characterMasteryCounts,
  }) = _Loaded;
}
