class Character {
  final String character;
  final String pinyin;
  final String meaning;
  final int frequency;
  final int strokeCount;
  final int difficulty;
  final List<String> components;
  final List<String> words;
  final List<String> sentences;
  final String strokeOrder;
  final String? radicals;
  final List<String>? similarCharacters;

  const Character({
    required this.character,
    required this.pinyin,
    required this.meaning,
    required this.frequency,
    required this.strokeCount,
    required this.difficulty,
    required this.components,
    required this.words,
    required this.sentences,
    required this.strokeOrder,
    this.radicals,
    this.similarCharacters,
  });
}
