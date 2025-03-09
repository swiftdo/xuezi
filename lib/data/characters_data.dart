class CharacterCategory {
  final String name;
  final String description;
  final List<String> characters;

  const CharacterCategory({
    required this.name,
    required this.description,
    required this.characters,
  });
}

class LearningLevel {
  final String name;
  final String description;
  final List<CharacterCategory> categories;

  const LearningLevel({
    required this.name,
    required this.description,
    required this.categories,
  });
}

class CharactersData {
  static const List<LearningLevel> levels = [
    LearningLevel(
      name: '基础生活用字',
      description: '生活中最常见、最实用的汉字，构建基本识字能力',
      categories: [
        CharacterCategory(
          name: '称谓类',
          description: '家庭成员称谓',
          characters: ['爸', '妈', '爷', '奶', '姐', '哥', '弟', '妹', '儿', '女'],
        ),
        CharacterCategory(
          name: '数字类',
          description: '基础数字和金额',
          characters: [
            '一',
            '二',
            '三',
            '四',
            '五',
            '六',
            '七',
            '八',
            '九',
            '十',
            '百',
            '千',
            '万',
            '零',
            '元'
          ],
        ),
        CharacterCategory(
          name: '时间类',
          description: '时间相关词汇',
          characters: [
            '年',
            '月',
            '日',
            '时',
            '分',
            '秒',
            '早',
            '中',
            '晚',
            '春',
            '夏',
            '秋',
            '冬',
            '昨',
            '今'
          ],
        ),
        CharacterCategory(
          name: '方位类',
          description: '方位指示词',
          characters: ['上', '下', '左', '右', '前', '后', '东', '西', '南', '北'],
        ),
        CharacterCategory(
          name: '日常用品类',
          description: '常见生活用品',
          characters: [
            '水',
            '米',
            '油',
            '盐',
            '茶',
            '菜',
            '肉',
            '鱼',
            '饭',
            '面',
            '衣',
            '裤',
            '鞋',
            '袜',
            '帽',
            '伞',
            '门',
            '窗',
            '床',
            '桌'
          ],
        ),
        CharacterCategory(
          name: '生活动作类',
          description: '日常生活动作',
          characters: [
            '吃',
            '喝',
            '走',
            '坐',
            '睡',
            '看',
            '听',
            '说',
            '买',
            '卖',
            '开',
            '关',
            '穿',
            '洗',
            '用'
          ],
        ),
        CharacterCategory(
          name: '常用标识类',
          description: '公共场所常见标识',
          characters: [
            '人',
            '男',
            '女',
            '入',
            '出',
            '停',
            '行',
            '危',
            '急',
            '推',
            '拉',
            '热',
            '冷',
            '开',
            '关'
          ],
        ),
      ],
    ),
    LearningLevel(
      name: '医疗健康用字',
      description: '医疗就诊相关的常用汉字',
      categories: [
        CharacterCategory(
          name: '身体部位类',
          description: '人体各部位名称',
          characters: [
            '头',
            '眼',
            '耳',
            '口',
            '手',
            '脚',
            '心',
            '肺',
            '胃',
            '血',
            '牙',
            '腿',
            '背',
            '肩',
            '腰'
          ],
        ),
        CharacterCategory(
          name: '症状类',
          description: '常见症状描述',
          characters: [
            '痛',
            '疼',
            '咳',
            '热',
            '冷',
            '肿',
            '胀',
            '麻',
            '痒',
            '晕',
            '饿',
            '渴',
            '困',
            '病',
            '药'
          ],
        ),
        CharacterCategory(
          name: '医疗场所类',
          description: '医院相关用语',
          characters: [
            '医',
            '院',
            '科',
            '室',
            '诊',
            '护',
            '急',
            '药',
            '针',
            '片',
            '号',
            '费',
            '单',
            '床',
            '查',
            '验',
            '化',
            '报',
            '卡',
            '证'
          ],
        ),
      ],
    ),
    LearningLevel(
      name: '出行交通用字',
      description: '出行和交通相关的常用汉字',
      categories: [
        CharacterCategory(
          name: '交通工具类',
          description: '各种交通工具',
          characters: ['车', '船', '机', '地', '铁', '公', '自', '电', '摩', '的'],
        ),
        CharacterCategory(
          name: '场所类',
          description: '交通相关场所',
          characters: [
            '站',
            '道',
            '路',
            '街',
            '口',
            '门',
            '房',
            '店',
            '市',
            '场',
            '厅',
            '室',
            '层',
            '楼',
            '梯'
          ],
        ),
        CharacterCategory(
          name: '方向指示类',
          description: '方向和指示词',
          characters: [
            '直',
            '行',
            '转',
            '往',
            '回',
            '进',
            '出',
            '上',
            '下',
            '左',
            '右',
            '开',
            '关',
            '红',
            '绿'
          ],
        ),
        CharacterCategory(
          name: '票务类',
          description: '票务相关用语',
          characters: ['票', '价', '钱', '卡', '次', '程', '号', '位', '检', '验'],
        ),
      ],
    ),
    LearningLevel(
      name: '休闲娱乐用字',
      description: '休闲娱乐相关的常用汉字',
      categories: [
        CharacterCategory(
          name: '娱乐场所类',
          description: '休闲场所名称',
          characters: [
            '园',
            '广',
            '场',
            '店',
            '馆',
            '影',
            '剧',
            '院',
            '厅',
            '室',
            '池',
            '山',
            '水',
            '花',
            '草'
          ],
        ),
        CharacterCategory(
          name: '活动类',
          description: '休闲活动动作',
          characters: [
            '走',
            '跑',
            '跳',
            '唱',
            '跳',
            '玩',
            '游',
            '练',
            '动',
            '息',
            '坐',
            '站',
            '看',
            '听',
            '说'
          ],
        ),
        CharacterCategory(
          name: '情感类',
          description: '情感表达用语',
          characters: [
            '好',
            '爱',
            '喜',
            '乐',
            '快',
            '开',
            '心',
            '笑',
            '高',
            '兴',
            '谢',
            '对',
            '错',
            '是',
            '不',
            '能',
            '会',
            '要',
            '行',
            '停'
          ],
        ),
      ],
    ),
  ];
}
