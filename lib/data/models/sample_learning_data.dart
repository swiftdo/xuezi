import '../../domain/entities/learning_unit.dart';
import '../../domain/entities/character.dart';

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
            Character(
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
            Character(
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
              type: 'stroke_recognition',
              description: '识别基本笔画',
              content: {
                'strokes': ['一', '丨'],
                'examples': ['横', '竖'],
              },
              difficulty: 1,
              estimatedTime: const Duration(minutes: 10),
            ),
          ],
          commonScenarios: ['书写练习', '部件识别'],
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
            Character(
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
            Character(
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
          ],
          commonScenarios: ['家庭交流', '日常称呼'],
        ),
      ],
    ),
  ];
}
