import 'character.dart';

class LearningUnit {
  final String id;
  final String name;
  final String description;
  final int targetCount;
  final int difficulty;
  final List<CharacterGroup> groups;
  final List<String>? prerequisites;
  final Duration estimatedTime;

  const LearningUnit({
    required this.id,
    required this.name,
    required this.description,
    required this.targetCount,
    required this.difficulty,
    required this.groups,
    this.prerequisites,
    required this.estimatedTime,
  });
}

class CharacterGroup {
  final String name;
  final String description;
  final List<Character> characters;
  final List<Exercise> exercises;
  final List<String> commonScenarios;

  const CharacterGroup({
    required this.name,
    required this.description,
    required this.characters,
    required this.exercises,
    required this.commonScenarios,
  });
}

class Exercise {
  final String type;
  final String description;
  final Map<String, dynamic> content;
  final int difficulty;
  final Duration estimatedTime;

  const Exercise({
    required this.type,
    required this.description,
    required this.content,
    required this.difficulty,
    required this.estimatedTime,
  });
}
