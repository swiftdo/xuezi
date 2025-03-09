import 'character_detail.dart';

class LearningUnit {
  final String id;
  final String name;
  final String description;
  final int targetCount;
  final int difficulty; // 1-5
  final List<CharacterGroup> groups;
  final List<String>? prerequisites; // 前置学习单元
  final Duration estimatedTime; // 预计学习时间

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
  final List<CharacterDetail> characters;
  final List<Exercise> exercises;
  final List<String> commonScenarios; // 常见使用场景

  const CharacterGroup({
    required this.name,
    required this.description,
    required this.characters,
    required this.exercises,
    required this.commonScenarios,
  });
}

class Exercise {
  final String type; // 练习类型：识字、组词、造句等
  final String description;
  final Map<String, dynamic> content; // 练习内容
  final int difficulty; // 1-5
  final Duration estimatedTime;

  const Exercise({
    required this.type,
    required this.description,
    required this.content,
    required this.difficulty,
    required this.estimatedTime,
  });
}

// 学习进度跟踪
class LearningProgress {
  final String unitId;
  final String characterId;
  final int masteryLevel; // 掌握程度：0-100
  final int reviewCount; // 复习次数
  final DateTime lastReviewDate;
  final List<ExerciseResult> exerciseResults;
  final int consecutiveCorrect; // 连续正确次数
  final DateTime nextReviewDate; // 下次复习日期
  final Map<String, int> exerciseTypeScores; // 各类练习的得分
  final List<String> commonMistakes; // 常见错误记录
  final Duration totalStudyTime; // 总学习时间

  const LearningProgress({
    required this.unitId,
    required this.characterId,
    required this.masteryLevel,
    required this.reviewCount,
    required this.lastReviewDate,
    required this.exerciseResults,
    this.consecutiveCorrect = 0,
    required this.nextReviewDate,
    required this.exerciseTypeScores,
    this.commonMistakes = const [],
    required this.totalStudyTime,
  });

  // 计算下次复习时间（基于艾宾浩斯遗忘曲线）
  static DateTime calculateNextReview(
      int consecutiveCorrect, DateTime lastReview) {
    final intervals = [
      const Duration(hours: 4), // 第一次复习
      const Duration(days: 1), // 第二次复习
      const Duration(days: 2), // 第三次复习
      const Duration(days: 4), // 第四次复习
      const Duration(days: 7), // 第五次复习
      const Duration(days: 15), // 第六次复习
      const Duration(days: 30), // 最终复习
    ];

    final index = consecutiveCorrect.clamp(0, intervals.length - 1);
    return lastReview.add(intervals[index]);
  }

  // 更新掌握度
  LearningProgress updateMastery({
    required bool isCorrect,
    required Duration studyTime,
    String? exerciseType,
    String? mistake,
  }) {
    final newConsecutiveCorrect = isCorrect ? consecutiveCorrect + 1 : 0;
    final newMasteryLevel = _calculateNewMasteryLevel(isCorrect);
    final newExerciseTypeScores = Map<String, int>.from(exerciseTypeScores);

    if (exerciseType != null) {
      final currentScore = newExerciseTypeScores[exerciseType] ?? 0;
      newExerciseTypeScores[exerciseType] = isCorrect
          ? (currentScore + 10).clamp(0, 100)
          : (currentScore - 5).clamp(0, 100);
    }

    final newMistakes = mistake != null && !isCorrect
        ? [...commonMistakes, mistake]
        : commonMistakes;

    return LearningProgress(
      unitId: unitId,
      characterId: characterId,
      masteryLevel: newMasteryLevel,
      reviewCount: reviewCount + 1,
      lastReviewDate: DateTime.now(),
      exerciseResults: [...exerciseResults],
      consecutiveCorrect: newConsecutiveCorrect,
      nextReviewDate:
          calculateNextReview(newConsecutiveCorrect, DateTime.now()),
      exerciseTypeScores: newExerciseTypeScores,
      commonMistakes: newMistakes,
      totalStudyTime: totalStudyTime + studyTime,
    );
  }

  int _calculateNewMasteryLevel(bool isCorrect) {
    final change = isCorrect ? 5 : -3;
    return (masteryLevel + change).clamp(0, 100);
  }
}

class ExerciseResult {
  final String exerciseId;
  final bool isCorrect;
  final int score; // 0-100
  final Duration timeSpent;
  final DateTime completedAt;

  const ExerciseResult({
    required this.exerciseId,
    required this.isCorrect,
    required this.score,
    required this.timeSpent,
    required this.completedAt,
  });
}
