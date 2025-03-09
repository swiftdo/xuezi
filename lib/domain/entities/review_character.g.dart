// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewCharacterImpl _$$ReviewCharacterImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewCharacterImpl(
      character: json['character'] as String,
      learnedAt: DateTime.parse(json['learnedAt'] as String),
      reviewDates: (json['reviewDates'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      needsReview: json['needsReview'] as bool,
      nextReviewDate: DateTime.parse(json['nextReviewDate'] as String),
    );

Map<String, dynamic> _$$ReviewCharacterImplToJson(
        _$ReviewCharacterImpl instance) =>
    <String, dynamic>{
      'character': instance.character,
      'learnedAt': instance.learnedAt.toIso8601String(),
      'reviewDates':
          instance.reviewDates.map((e) => e.toIso8601String()).toList(),
      'reviewCount': instance.reviewCount,
      'needsReview': instance.needsReview,
      'nextReviewDate': instance.nextReviewDate.toIso8601String(),
    };
