part of 'learning_statistics_bloc.dart';

@freezed
class LearningStatisticsEvent with _$LearningStatisticsEvent {
  const factory LearningStatisticsEvent.started(String planId) = _Started;
}
