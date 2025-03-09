part of 'learning_plan_bloc.dart';

@freezed
class LearningPlanEvent with _$LearningPlanEvent {
  const factory LearningPlanEvent.started() = _Started;
  const factory LearningPlanEvent.savePlan(LearningPlan plan) = _SavePlan;
  const factory LearningPlanEvent.updatePlan(LearningPlan plan) = _UpdatePlan;
  const factory LearningPlanEvent.deletePlan(String id) = _DeletePlan;
}
