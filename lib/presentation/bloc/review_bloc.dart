import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/review_character.dart';
import '../../domain/repositories/learning_record_repository.dart';

part 'review_bloc.freezed.dart';
part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final LearningRecordRepository _repository;

  ReviewBloc(this._repository) : super(const ReviewState.initial()) {
    on<_Started>(_onStarted);
    on<_CharacterReviewed>(_onCharacterReviewed);
  }

  Future<void> _onStarted(_Started event, Emitter<ReviewState> emit) async {
    emit(const ReviewState.loading());
    try {
      final characters = await _repository.getReviewCharactersForToday();
      emit(ReviewState.loaded(
        reviewCharacters: characters,
        totalReviewed: 0,
        totalRemembered: 0,
      ));
    } catch (e) {
      emit(ReviewState.error(e.toString()));
    }
  }

  void _onCharacterReviewed(
    _CharacterReviewed event,
    Emitter<ReviewState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is! _Loaded) return;

      final character = event.character;
      final remembered = event.remembered;
      final now = DateTime.now();

      // Get the current review character
      final characters = await _repository.getReviewCharactersForToday();
      final reviewChar = characters.firstWhere(
        (c) => c.character == character,
        orElse: () => throw Exception('Character not found'),
      );

      // Update review character
      final updatedChar = ReviewCharacter(
        character: character,
        learnedAt: reviewChar.learnedAt,
        reviewDates: [...reviewChar.reviewDates, now],
        reviewCount: reviewChar.reviewCount + 1,
        needsReview: !remembered,
        nextReviewDate: remembered
            ? ReviewCharacter.calculateNextReviewDate(
                now,
                reviewChar.reviewCount + 1,
              )
            : ReviewCharacter.calculateNextReviewDate(now, 0),
      );

      await _repository.updateReviewCharacter(updatedChar);

      // Reload today's review characters
      final updatedCharacters = await _repository.getReviewCharactersForToday();

      emit(ReviewState.loaded(
        reviewCharacters: updatedCharacters,
        totalReviewed: currentState.totalReviewed + 1,
        totalRemembered: currentState.totalRemembered + (remembered ? 1 : 0),
      ));
    } catch (e) {
      emit(ReviewState.error(e.toString()));
    }
  }
}
