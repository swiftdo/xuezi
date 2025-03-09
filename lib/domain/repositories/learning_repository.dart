import '../entities/learning_unit.dart';

abstract class LearningRepository {
  Future<List<LearningUnit>> getBasicUnits();
  Future<LearningUnit?> getLearningUnit(String id);
  Future<double> getLearningProgress(String unitId);
  Future<void> updateLearningProgress(String unitId, double progress);
  Future<List<String>> getCompletedUnits();
  Future<List<LearningUnit>> getRecommendedUnits();
}
