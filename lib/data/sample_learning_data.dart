import 'character_detail.dart';
import 'learning_unit.dart';

class SampleLearningData {
  static final List<LearningUnit> basicUnits = [
    LearningUnit(
      id: 'basic_1',
      name: '基础笔画和部件',
      description: '学习汉字最基本的笔画和常用部件',
      targetCount: 20,
      difficulty: 1,
      estimatedTime: const Duration(days: 7),
      groups: [
        CharacterGroup(
          name: '基本笔画',
          description: '汉字的基本笔画',
          characters: [
            CharacterDetail(
              character: '一',
              pinyin: 'yī',
              meaning: '数字一；第一',
              frequency: 1,
              strokeCount: 1,
              difficulty: 1,
              components: ['一'],
              words: ['一个', '一天', '一年'],
              sentences: ['这是一本书。', '我有一个苹果。'],
              strokeOrder: '一',
              radicals: '一',
              similarCharacters: ['二', '三'],
            ),
            CharacterDetail(
              character: '丨',
              pinyin: 'gǔn',
              meaning: '竖直线',
              frequency: 100,
              strokeCount: 1,
              difficulty: 1,
              components: ['丨'],
              words: ['竖线'],
              sentences: ['这是一个竖线。'],
              strokeOrder: '丨',
            ),
          ],
          exercises: [
            Exercise(
              type: 'recognition',
              description: '识别基本笔画',
              content: {
                'questions': [
                  {
                    'character': '一',
                    'options': ['横线', '竖线', '撇', '捺']
                  },
                  {
                    'character': '丨',
                    'options': ['竖线', '横线', '点', '折']
                  },
                ],
              },
              difficulty: 1,
              estimatedTime: const Duration(minutes: 5),
            ),
            Exercise(
              type: 'writing',
              description: '书写练习',
              content: {
                'characters': ['一', '丨'],
                'repetitions': 5,
              },
              difficulty: 1,
              estimatedTime: const Duration(minutes: 10),
            ),
          ],
          commonScenarios: ['写字基础', '识字入门'],
        ),
        CharacterGroup(
          name: '基础部件',
          description: '常用汉字部件',
          characters: [
            CharacterDetail(
              character: '口',
              pinyin: 'kǒu',
              meaning: '嘴巴；口子；入口',
              frequency: 10,
              strokeCount: 3,
              difficulty: 2,
              components: ['口'],
              words: ['口水', '门口', '开口'],
              sentences: ['门口有一个人。', '请张开口。'],
              strokeOrder: '㇐㇑㇐',
              radicals: '口',
              similarCharacters: ['日', '田'],
            ),
          ],
          exercises: [
            Exercise(
              type: 'component_recognition',
              description: '识别部件',
              content: {
                'components': ['口', '日', '田'],
                'questions': [
                  {'character': '晶', 'answer': '日'},
                  {'character': '回', 'answer': '口'},
                ],
              },
              difficulty: 2,
              estimatedTime: const Duration(minutes: 8),
            ),
          ],
          commonScenarios: ['部件识别', '汉字结构分析'],
        ),
      ],
    ),
    LearningUnit(
      id: 'basic_2',
      name: '家庭称谓',
      description: '学习家庭成员的称呼',
      targetCount: 10,
      difficulty: 1,
      prerequisites: ['basic_1'],
      estimatedTime: const Duration(days: 5),
      groups: [
        CharacterGroup(
          name: '直系亲属',
          description: '最基本的家庭称谓',
          characters: [
            CharacterDetail(
              character: '爸',
              pinyin: 'bà',
              meaning: '父亲',
              frequency: 50,
              strokeCount: 8,
              difficulty: 2,
              components: ['父', '巴'],
              words: ['爸爸', '老爸', '爸妈'],
              sentences: ['我的爸爸很高。', '爸爸去上班了。'],
              strokeOrder: '丶一丿丨フ一丨丿',
              radicals: '父',
              similarCharacters: ['爹', '把'],
            ),
            CharacterDetail(
              character: '妈',
              pinyin: 'mā',
              meaning: '母亲',
              frequency: 51,
              strokeCount: 6,
              difficulty: 2,
              components: ['女', '马'],
              words: ['妈妈', '老妈', '爸妈'],
              sentences: ['妈妈在做饭。', '我爱妈妈。'],
              strokeOrder: '丿㇔丿一丨丿',
              radicals: '女',
              similarCharacters: ['姆', '媽'],
            ),
          ],
          exercises: [
            Exercise(
              type: 'word_formation',
              description: '组词练习',
              content: {
                'characters': ['爸', '妈'],
                'target_words': ['爸爸', '妈妈', '爸妈'],
              },
              difficulty: 1,
              estimatedTime: const Duration(minutes: 10),
            ),
            Exercise(
              type: 'sentence_making',
              description: '造句练习',
              content: {
                'words': ['爸爸', '妈妈'],
                'example_sentences': ['爸爸去上班。', '妈妈在做饭。'],
              },
              difficulty: 2,
              estimatedTime: const Duration(minutes: 15),
            ),
          ],
          commonScenarios: ['家庭交流', '日常称呼'],
        ),
      ],
    ),
  ];

  // 获取特定难度的学习单元
  static List<LearningUnit> getUnitsByDifficulty(int difficulty) {
    return basicUnits.where((unit) => unit.difficulty == difficulty).toList();
  }

  // 获取没有前置要求的入门单元
  static List<LearningUnit> getEntryUnits() {
    return basicUnits
        .where(
            (unit) => unit.prerequisites == null || unit.prerequisites!.isEmpty)
        .toList();
  }

  // 获取特定字符的详细信息
  static CharacterDetail? getCharacterDetail(String character) {
    for (var unit in basicUnits) {
      for (var group in unit.groups) {
        for (var detail in group.characters) {
          if (detail.character == character) {
            return detail;
          }
        }
      }
    }
    return null;
  }

  // 获取推荐的下一个学习单元
  static LearningUnit? getNextRecommendedUnit(List<String> completedUnitIds) {
    for (var unit in basicUnits) {
      if (!completedUnitIds.contains(unit.id)) {
        if (unit.prerequisites == null ||
            unit.prerequisites!
                .every((prereq) => completedUnitIds.contains(prereq))) {
          return unit;
        }
      }
    }
    return null;
  }
}
