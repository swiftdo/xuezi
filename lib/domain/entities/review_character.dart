import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_character.freezed.dart';
part 'review_character.g.dart';

@freezed
class ReviewCharacter with _$ReviewCharacter {
  const factory ReviewCharacter({
    required String character,
    required DateTime learnedAt,
    required List<DateTime> reviewDates,
    required int reviewCount,
    required bool needsReview,
    required DateTime nextReviewDate,
  }) = _ReviewCharacter;

  factory ReviewCharacter.fromJson(Map<String, dynamic> json) =>
      _$ReviewCharacterFromJson(json);

  static List<int> reviewDays = [1, 2, 4, 7, 15, 30];

  static DateTime calculateNextReviewDate(DateTime learnedAt, int reviewCount) {
    if (reviewCount >= reviewDays.length) {
      return DateTime(9999); // 已完成所有复习
    }
    return learnedAt.add(Duration(days: reviewDays[reviewCount]));
  }
}
