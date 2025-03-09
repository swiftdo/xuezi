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

  Future<void> _onCharacterReviewed(
      _CharacterReviewed event, Emitter<ReviewState> emit) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    try {
      final characters = [...currentState.reviewCharacters];
      final index =
          characters.indexWhere((char) => char.character == event.character);
      if (index == -1) return;

      final character = characters[index];
      final updatedCharacter = ReviewCharacter(
        character: character.character,
        learnedAt: character.learnedAt,
        reviewDates: [...character.reviewDates, DateTime.now()],
        reviewCount: character.reviewCount + 1,
        needsReview: !event.remembered,
        nextReviewDate: event.remembered
            ? ReviewCharacter.calculateNextReviewDate(
                character.learnedAt, character.reviewCount + 1)
            : character.nextReviewDate,
      );

      await _repository.updateReviewCharacter(updatedCharacter);
      characters.removeAt(index);

      emit(ReviewState.loaded(
        reviewCharacters: characters,
        totalReviewed: currentState.totalReviewed + 1,
        totalRemembered:
            currentState.totalRemembered + (event.remembered ? 1 : 0),
      ));
    } catch (e) {
      emit(ReviewState.error(e.toString()));
    }
  }
}
