class GradeLevel {
  final String name;
  final String description;
  final int targetCount;
  final List<CharacterUnit> units;

  const GradeLevel({
    required this.name,
    required this.description,
    required this.targetCount,
    required this.units,
  });
}

class CharacterUnit {
  final String name;
  final String description;
  final int targetCount;
  final List<CharacterSection> sections;

  const CharacterUnit({
    required this.name,
    required this.description,
    required this.targetCount,
    required this.sections,
  });
}

class CharacterSection {
  final String name;
  final String description;
  final List<String> characters;
  final List<String>? examples;
  final List<String>? words;

  const CharacterSection({
    required this.name,
    required this.description,
    required this.characters,
    this.examples,
    this.words,
  });
}

class PrimarySchoolCharacters {
  static const List<GradeLevel> grades = [
    // 一年级
    GradeLevel(
      name: '一年级',
      description: '最基础的生活用字',
      targetCount: 500,
      units: [
        CharacterUnit(
          name: '基础部件',
          description: '汉字的基本笔画和部件',
          targetCount: 50,
          sections: [
            CharacterSection(
              name: '基本笔画',
              description: '汉字最基本的笔画',
              characters: ['一', '丨', '丶', '丿', '乙', '乚', '乛'],
              examples: ['横折(乛)', '竖折(乚)', '横撇(乙)'],
            ),
            CharacterSection(
              name: '基础部件',
              description: '常用的汉字部件',
              characters: ['口', '日', '月', '木', '山', '水', '火', '土'],
              examples: ['木字旁', '山字旁', '水字旁'],
            ),
          ],
        ),
        CharacterUnit(
          name: '人物称谓',
          description: '家庭和社会常用称谓',
          targetCount: 50,
          sections: [
            CharacterSection(
              name: '家庭称谓',
              description: '家庭成员的称呼',
              characters: ['爸', '妈', '爷', '奶', '姐', '哥', '弟', '妹', '儿', '女'],
              words: ['爸爸', '妈妈', '爷爷', '奶奶'],
            ),
            CharacterSection(
              name: '社会称谓',
              description: '社会交往中的称呼',
              characters: ['人', '老', '师', '生', '同', '友'],
              words: ['老师', '同学', '朋友'],
            ),
          ],
        ),
        // 可以继续添加更多单元...
      ],
    ),
    // 可以继续添加更多年级...
  ];

  // 获取特定年级的字表
  static List<String> getGradeCharacters(int grade) {
    if (grade < 0 || grade >= grades.length) return [];

    final List<String> characters = [];
    for (var unit in grades[grade].units) {
      for (var section in unit.sections) {
        characters.addAll(section.characters);
      }
    }
    return characters;
  }

  // 获取特定年级的词语表
  static List<String> getGradeWords(int grade) {
    if (grade < 0 || grade >= grades.length) return [];

    final List<String> words = [];
    for (var unit in grades[grade].units) {
      for (var section in unit.sections) {
        if (section.words != null) {
          words.addAll(section.words!);
        }
      }
    }
    return words;
  }

  // 获取所有年级的字表
  static List<String> getAllCharacters() {
    final List<String> characters = [];
    for (var grade in grades) {
      for (var unit in grade.units) {
        for (var section in unit.sections) {
          characters.addAll(section.characters);
        }
      }
    }
    return characters;
  }
}
