import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/learning_record.dart';
import '../../domain/entities/review_character.dart';
import '../../domain/repositories/learning_record_repository.dart';

class LearningRecordRepositoryImpl implements LearningRecordRepository {
  final SharedPreferences _prefs;
  static const String _recordsKey = 'learning_records';
  static const String _reviewCharactersKey = 'review_characters';

  LearningRecordRepositoryImpl(this._prefs);

  @override
  Future<void> saveLearningRecord(LearningRecord record) async {
    final records = await getLearningRecords();
    records.add(record);
    final jsonList = records.map((r) => r.toJson()).toList();
    await _prefs.setString(_recordsKey, jsonEncode(jsonList));
  }

  @override
  Future<List<LearningRecord>> getLearningRecords() async {
    final jsonString = _prefs.getString(_recordsKey);
    if (jsonString == null) return [];
    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((json) => LearningRecord.fromJson(json)).toList();
  }

  @override
  Future<void> saveReviewCharacter(ReviewCharacter character) async {
    final characters = await _getReviewCharacters();
    characters.add(character);
    await _saveReviewCharacters(characters);
  }

  @override
  Future<List<ReviewCharacter>> getReviewCharactersForToday() async {
    final characters = await _getReviewCharacters();
    final now = DateTime.now();
    return characters.where((char) {
      final nextReview = char.nextReviewDate;
      return char.needsReview &&
          nextReview.year == now.year &&
          nextReview.month == now.month &&
          nextReview.day == now.day;
    }).toList();
  }

  @override
  Future<void> updateReviewCharacter(ReviewCharacter character) async {
    final characters = await _getReviewCharacters();
    final index =
        characters.indexWhere((c) => c.character == character.character);
    if (index != -1) {
      characters[index] = character;
      await _saveReviewCharacters(characters);
    }
  }

  Future<List<ReviewCharacter>> _getReviewCharacters() async {
    final jsonString = _prefs.getString(_reviewCharactersKey);
    if (jsonString == null) return [];
    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((json) => ReviewCharacter.fromJson(json)).toList();
  }

  Future<void> _saveReviewCharacters(List<ReviewCharacter> characters) async {
    final jsonList = characters.map((c) => c.toJson()).toList();
    await _prefs.setString(_reviewCharactersKey, jsonEncode(jsonList));
  }
}
