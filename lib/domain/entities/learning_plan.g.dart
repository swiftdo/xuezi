// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearningPlanImpl _$$LearningPlanImplFromJson(Map<String, dynamic> json) =>
    _$LearningPlanImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      targetCharactersPerDay: (json['targetCharactersPerDay'] as num).toInt(),
      targetStudyTimePerDay: Duration(
          microseconds: (json['targetStudyTimePerDay'] as num).toInt()),
      selectedCategories: (json['selectedCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      exerciseTypeGoals:
          Map<String, int>.from(json['exerciseTypeGoals'] as Map),
      isActive: json['isActive'] as bool,
      dailyGoals: (json['dailyGoals'] as List<dynamic>)
          .map((e) => DailyGoal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LearningPlanImplToJson(_$LearningPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'targetCharactersPerDay': instance.targetCharactersPerDay,
      'targetStudyTimePerDay': instance.targetStudyTimePerDay.inMicroseconds,
      'selectedCategories': instance.selectedCategories,
      'exerciseTypeGoals': instance.exerciseTypeGoals,
      'isActive': instance.isActive,
      'dailyGoals': instance.dailyGoals,
    };

_$DailyGoalImpl _$$DailyGoalImplFromJson(Map<String, dynamic> json) =>
    _$DailyGoalImpl(
      date: DateTime.parse(json['date'] as String),
      charactersToLearn: (json['charactersToLearn'] as num).toInt(),
      studyTime: Duration(microseconds: (json['studyTime'] as num).toInt()),
      isCompleted: json['isCompleted'] as bool,
      exerciseCompletion:
          Map<String, bool>.from(json['exerciseCompletion'] as Map),
    );

Map<String, dynamic> _$$DailyGoalImplToJson(_$DailyGoalImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'charactersToLearn': instance.charactersToLearn,
      'studyTime': instance.studyTime.inMicroseconds,
      'isCompleted': instance.isCompleted,
      'exerciseCompletion': instance.exerciseCompletion,
    };
