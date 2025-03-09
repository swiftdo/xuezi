import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_plan.freezed.dart';
part 'learning_plan.g.dart';

@freezed
class LearningPlan with _$LearningPlan {
  const factory LearningPlan({
    required String id,
    required String name,
    required DateTime startDate,
    required DateTime endDate,
    required int targetCharactersPerDay,
    required Duration targetStudyTimePerDay,
    required List<String> selectedCategories,
    required Map<String, int> exerciseTypeGoals,
    required bool isActive,
    required List<DailyGoal> dailyGoals,
  }) = _LearningPlan;

  factory LearningPlan.fromJson(Map<String, dynamic> json) =>
      _$LearningPlanFromJson(json);
}

@freezed
class DailyGoal with _$DailyGoal {
  const factory DailyGoal({
    required DateTime date,
    required int charactersToLearn,
    required Duration studyTime,
    required bool isCompleted,
    required Map<String, bool> exerciseCompletion,
  }) = _DailyGoal;

  factory DailyGoal.fromJson(Map<String, dynamic> json) =>
      _$DailyGoalFromJson(json);
}
