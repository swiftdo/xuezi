part of 'learning_plan_bloc.dart';

@freezed
class LearningPlanState with _$LearningPlanState {
  const factory LearningPlanState.initial() = _Initial;
  const factory LearningPlanState.loading() = _Loading;
  const factory LearningPlanState.loaded(List<LearningPlan> plans) = _Loaded;
  const factory LearningPlanState.error(String message) = _Error;
}
