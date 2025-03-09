import '../entities/learning_record.dart';

abstract class LearningRecordRepository {
  Future<void> saveLearningRecord(LearningRecord record);
  Future<List<LearningRecord>> getLearningRecords(String planId);
  Future<List<LearningRecord>> getLearningRecordsByDate(DateTime date);
  Future<LearningRecord?> getLastLearningRecord(String planId);
  Future<Map<String, int>> getCharacterMasteryCount(String planId);
}
