import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_record.freezed.dart';
part 'learning_record.g.dart';

@freezed
class LearningRecord with _$LearningRecord {
  const factory LearningRecord({
    required String id,
    required String planId,
    required DateTime startTime,
    required DateTime endTime,
    required Duration totalStudyTime,
    required List<String> knownCharacters,
    required List<String> unknownCharacters,
    required int targetCharactersPerDay,
    required Duration targetStudyTimePerDay,
  }) = _LearningRecord;

  factory LearningRecord.fromJson(Map<String, dynamic> json) =>
      _$LearningRecordFromJson(json);
}

@freezed
class ExerciseRecord with _$ExerciseRecord {
  const factory ExerciseRecord({
    required String type,
    required DateTime timestamp,
    required int characterCount,
    String? notes,
  }) = _ExerciseRecord;

  factory ExerciseRecord.fromJson(Map<String, dynamic> json) =>
      _$ExerciseRecordFromJson(json);
}
