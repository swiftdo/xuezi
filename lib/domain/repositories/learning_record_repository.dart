import '../entities/learning_record.dart';
import '../entities/review_character.dart';

abstract class LearningRecordRepository {
  Future<void> saveLearningRecord(LearningRecord record);
  Future<List<LearningRecord>> getLearningRecords();
  Future<void> saveReviewCharacter(ReviewCharacter character);
  Future<List<ReviewCharacter>> getReviewCharactersForToday();
  Future<void> updateReviewCharacter(ReviewCharacter character);
}
