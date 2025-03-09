part of 'review_bloc.dart';

@freezed
class ReviewEvent with _$ReviewEvent {
  const factory ReviewEvent.started() = _Started;
  const factory ReviewEvent.characterReviewed({
    required String character,
    required bool remembered,
  }) = _CharacterReviewed;
}
