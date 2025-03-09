class CharacterDetail {
  final String character;
  final String pinyin;
  final String meaning;
  final int frequency; // 使用频率排名
  final int strokeCount; // 笔画数
  final int difficulty; // 难度等级：1-5
  final List<String> components; // 部件
  final List<String> words; // 常用词语
  final List<String> sentences; // 例句
  final String? strokeOrder; // 笔顺
  final String? radicals; // 部首
  final List<String>? similarCharacters; // 形近字

  const CharacterDetail({
    required this.character,
    required this.pinyin,
    required this.meaning,
    required this.frequency,
    required this.strokeCount,
    required this.difficulty,
    required this.components,
    required this.words,
    required this.sentences,
    this.strokeOrder,
    this.radicals,
    this.similarCharacters,
  });
}
