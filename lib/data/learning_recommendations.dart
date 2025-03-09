import 'learning_unit.dart';
import 'character_detail.dart';
import 'sample_learning_data.dart';

class LearningRecommendations {
  static const int _maxDailyNewCharacters = 5;
  static const int _maxDailyReviews = 20;

  // 获取今日推荐学习内容
  static List<RecommendedLearning> getDailyRecommendations(
    List<LearningProgress> learningHistory,
    DateTime currentDate,
  ) {
    final recommendations = <RecommendedLearning>[];

    // 添加需要复习的字符
    final reviewDue = _getCharactersDueForReview(learningHistory, currentDate);
    recommendations.addAll(reviewDue.map((progress) => RecommendedLearning(
          character: progress.characterId,
          type: LearningRecommendationType.review,
          priority: _calculateReviewPriority(progress),
          reason: '根据遗忘曲线，现在是复习的最佳时机',
        )));

    // 如果复习数量未达到上限，添加新字符
    if (recommendations.length < _maxDailyReviews) {
      final newCharacters = _getNewCharactersToLearn(
        learningHistory,
        _maxDailyNewCharacters,
      );
      recommendations.addAll(newCharacters.map((char) => RecommendedLearning(
            character: char,
            type: LearningRecommendationType.new_character,
            priority: 1.0,
            reason: '基于您的学习进度推荐的新字符',
          )));
    }

    // 按优先级排序
    recommendations.sort((a, b) => b.priority.compareTo(a.priority));
    return recommendations;
  }

  // 获取需要复习的字符
  static List<LearningProgress> _getCharactersDueForReview(
    List<LearningProgress> history,
    DateTime currentDate,
  ) {
    return history
        .where((progress) => progress.nextReviewDate.isBefore(currentDate))
        .toList()
      ..sort((a, b) => a.nextReviewDate.compareTo(b.nextReviewDate));
  }

  // 获取建议学习的新字符
  static List<String> _getNewCharactersToLearn(
    List<LearningProgress> history,
    int limit,
  ) {
    final learnedCharacters = history.map((p) => p.characterId).toSet();
    final allUnits = SampleLearningData.basicUnits;
    final newCharacters = <String>[];

    for (var unit in allUnits) {
      if (newCharacters.length >= limit) break;

      for (var group in unit.groups) {
        for (var char in group.characters) {
          if (!learnedCharacters.contains(char.character)) {
            newCharacters.add(char.character);
            if (newCharacters.length >= limit) break;
          }
        }
        if (newCharacters.length >= limit) break;
      }
    }

    return newCharacters;
  }

  // 计算复习优先级
  static double _calculateReviewPriority(LearningProgress progress) {
    final daysOverdue =
        DateTime.now().difference(progress.nextReviewDate).inDays;

    // 基础优先级：过期天数 * 0.1（最高1.0）
    double priority = (daysOverdue * 0.1).clamp(0.0, 1.0);

    // 根据掌握度调整：掌握度越低，优先级越高
    priority += (100 - progress.masteryLevel) / 100;

    // 根据连续正确次数调整：连续正确越少，优先级越高
    priority += (5 - progress.consecutiveCorrect.clamp(0, 5)) * 0.1;

    return priority.clamp(0.0, 2.0);
  }
}

class RecommendedLearning {
  final String character;
  final LearningRecommendationType type;
  final double priority; // 0.0 - 2.0
  final String reason;

  const RecommendedLearning({
    required this.character,
    required this.type,
    required this.priority,
    required this.reason,
  });
}

enum LearningRecommendationType {
  review,
  new_character,
}
