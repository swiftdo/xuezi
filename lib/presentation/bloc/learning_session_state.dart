part of 'learning_session_bloc.dart';

@freezed
class LearningSessionState with _$LearningSessionState {
  const factory LearningSessionState({
    required LearningPlan plan,
    required DateTime startTime,
    required Duration totalStudyTime,
    required int charactersLearned,
    required bool isActive,
    required List<String> completedExercises,
    required List<String> knownCharacters,
    required List<String> unknownCharacters,
    required List<String> characters,
    DateTime? lastResumeTime,
  }) = _LearningSessionState;

  factory LearningSessionState.initial(LearningPlan plan) =>
      LearningSessionState(
        plan: plan,
        startTime: DateTime.now(),
        totalStudyTime: Duration.zero,
        charactersLearned: 0,
        isActive: false,
        completedExercises: const [],
        knownCharacters: const [],
        unknownCharacters: const [],
        characters: const [],
      );
}
