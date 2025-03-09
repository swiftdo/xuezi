// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearningRecordImpl _$$LearningRecordImplFromJson(Map<String, dynamic> json) =>
    _$LearningRecordImpl(
      id: json['id'] as String,
      planId: json['planId'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      totalStudyTime:
          Duration(microseconds: (json['totalStudyTime'] as num).toInt()),
      knownCharacters: (json['knownCharacters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      unknownCharacters: (json['unknownCharacters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      targetCharactersPerDay: (json['targetCharactersPerDay'] as num).toInt(),
      targetStudyTimePerDay: Duration(
          microseconds: (json['targetStudyTimePerDay'] as num).toInt()),
    );

Map<String, dynamic> _$$LearningRecordImplToJson(
        _$LearningRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'totalStudyTime': instance.totalStudyTime.inMicroseconds,
      'knownCharacters': instance.knownCharacters,
      'unknownCharacters': instance.unknownCharacters,
      'targetCharactersPerDay': instance.targetCharactersPerDay,
      'targetStudyTimePerDay': instance.targetStudyTimePerDay.inMicroseconds,
    };

_$ExerciseRecordImpl _$$ExerciseRecordImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseRecordImpl(
      type: json['type'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      characterCount: (json['characterCount'] as num).toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ExerciseRecordImplToJson(
        _$ExerciseRecordImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'timestamp': instance.timestamp.toIso8601String(),
      'characterCount': instance.characterCount,
      'notes': instance.notes,
    };
