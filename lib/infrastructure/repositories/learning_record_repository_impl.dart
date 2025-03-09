import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/learning_record.dart';
import '../../domain/repositories/learning_record_repository.dart';

class LearningRecordRepositoryImpl implements LearningRecordRepository {
  static const String _recordsKey = 'learning_records';
  final SharedPreferences _prefs;

  LearningRecordRepositoryImpl(this._prefs);

  @override
  Future<void> saveLearningRecord(LearningRecord record) async {
    final records = await _getAllRecords();
    records.add(record);
    await _saveRecords(records);
  }

  @override
  Future<List<LearningRecord>> getLearningRecords(String planId) async {
    final records = await _getAllRecords();
    return records.where((record) => record.planId == planId).toList();
  }

  @override
  Future<List<LearningRecord>> getLearningRecordsByDate(DateTime date) async {
    final records = await _getAllRecords();
    return records.where((record) {
      final recordDate = record.startTime;
      return recordDate.year == date.year &&
          recordDate.month == date.month &&
          recordDate.day == date.day;
    }).toList();
  }

  @override
  Future<LearningRecord?> getLastLearningRecord(String planId) async {
    final records = await getLearningRecords(planId);
    if (records.isEmpty) return null;
    return records.reduce((a, b) => a.endTime.isAfter(b.endTime) ? a : b);
  }

  @override
  Future<Map<String, int>> getCharacterMasteryCount(String planId) async {
    final records = await getLearningRecords(planId);
    final masteryCounts = <String, int>{};

    for (final record in records) {
      for (final character in record.knownCharacters) {
        masteryCounts[character] = (masteryCounts[character] ?? 0) + 1;
      }
      for (final character in record.unknownCharacters) {
        masteryCounts[character] = (masteryCounts[character] ?? 0) - 1;
      }
    }

    return masteryCounts;
  }

  Future<List<LearningRecord>> _getAllRecords() async {
    final recordsJson = _prefs.getStringList(_recordsKey) ?? [];
    return recordsJson
        .map((json) => LearningRecord.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<void> _saveRecords(List<LearningRecord> records) async {
    final recordsJson =
        records.map((record) => jsonEncode(record.toJson())).toList();
    await _prefs.setStringList(_recordsKey, recordsJson);
  }
}
