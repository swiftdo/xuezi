import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/learning_record.dart';
import '../../domain/entities/review_character.dart';
import '../../domain/repositories/learning_record_repository.dart';

class LearningRecordRepositoryImpl implements LearningRecordRepository {
  final SharedPreferences _prefs;
  static const String _recordsKey = 'learning_records';
  static const String _reviewCharactersKey = 'review_characters';

  List<LearningRecord>? _cachedRecords;
  List<ReviewCharacter>? _cachedCharacters;

  LearningRecordRepositoryImpl(this._prefs);

  @override
  Future<void> saveLearningRecord(LearningRecord record) async {
    final records = await getLearningRecords();
    records.add(record);
    _cachedRecords = records;

    final jsonList = records.map((r) => jsonEncode(r.toJson())).toList();
    await _prefs.setStringList(_recordsKey, jsonList);
  }

  @override
  Future<List<LearningRecord>> getLearningRecords() async {
    if (_cachedRecords != null) {
      return _cachedRecords!;
    }

    final jsonList = _prefs.getStringList(_recordsKey) ?? [];
    _cachedRecords = jsonList
        .map((jsonString) => LearningRecord.fromJson(jsonDecode(jsonString)))
        .toList();
    return _cachedRecords!;
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
    if (_cachedCharacters != null) {
      return _cachedCharacters!;
    }

    final jsonList = _prefs.getStringList(_reviewCharactersKey) ?? [];
    _cachedCharacters = jsonList
        .map((jsonString) => ReviewCharacter.fromJson(jsonDecode(jsonString)))
        .toList();
    return _cachedCharacters!;
  }

  Future<void> _saveReviewCharacters(List<ReviewCharacter> characters) async {
    _cachedCharacters = characters;
    final jsonList = characters.map((c) => jsonEncode(c.toJson())).toList();
    await _prefs.setStringList(_reviewCharactersKey, jsonList);
  }

  void clearCache() {
    _cachedRecords = null;
    _cachedCharacters = null;
  }
}
