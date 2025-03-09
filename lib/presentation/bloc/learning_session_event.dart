part of 'learning_session_bloc.dart';

@freezed
class LearningSessionEvent with _$LearningSessionEvent {
  const factory LearningSessionEvent.started() = _Started;
  const factory LearningSessionEvent.paused() = _Paused;
  const factory LearningSessionEvent.resumed() = _Resumed;
  const factory LearningSessionEvent.characterLearned({
    required String character,
    required bool isKnown,
  }) = _CharacterLearned;
  const factory LearningSessionEvent.characterUndone({
    required String character,
  }) = _CharacterUndone;
  const factory LearningSessionEvent.endSession() = _EndSession;
  const factory LearningSessionEvent.restart() = _Restart;
}
