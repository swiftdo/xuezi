import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_statistics.freezed.dart';

@freezed
class LearningStatistics with _$LearningStatistics {
  const factory LearningStatistics({
    required int totalCharactersLearned,
    required int totalReviewCount,
    required Duration totalStudyTime,
    required double averageMasteryLevel,
    required Map<String, int> exerciseTypeDistribution,
    required List<DailyProgress> dailyProgress,
    required String currentStreak,
    required int totalDaysLearned,
    required Map<String, double> categoryProgress,
  }) = _LearningStatistics;
}

@freezed
class DailyProgress with _$DailyProgress {
  const factory DailyProgress({
    required DateTime date,
    required int newCharactersLearned,
    required int reviewsCompleted,
    required double averageMasteryLevel,
    required Duration studyTime,
    required List<String> completedExercises,
  }) = _DailyProgress;
}
