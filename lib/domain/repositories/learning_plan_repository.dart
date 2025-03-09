import '../entities/learning_plan.dart';

abstract class LearningPlanRepository {
  Future<List<LearningPlan>> getAllPlans();
  Future<LearningPlan?> getPlanById(String id);
  Future<void> savePlan(LearningPlan plan);
  Future<void> deletePlan(String id);
  Future<void> updatePlan(LearningPlan plan);
  Future<List<LearningPlan>> getActivePlans();
}
