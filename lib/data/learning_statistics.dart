import 'learning_unit.dart';

class LearningStatistics {
  // 学习概览
  final int totalCharactersLearned;
  final int totalReviewCount;
  final Duration totalStudyTime;
  final double averageMasteryLevel;
  final Map<String, int> exerciseTypeDistribution;
  final List<DailyProgress> dailyProgress;

  const LearningStatistics({
    required this.totalCharactersLearned,
    required this.totalReviewCount,
    required this.totalStudyTime,
    required this.averageMasteryLevel,
    required this.exerciseTypeDistribution,
    required this.dailyProgress,
  });

  // 从学习历史生成统计数据
  static LearningStatistics generateFromHistory(
    List<LearningProgress> history,
    DateTime startDate,
    DateTime endDate,
  ) {
    // 计算总字符数
    final learnedCharacters = history.map((p) => p.characterId).toSet();

    // 计算总复习次数
    final totalReviews = history.fold<int>(
      0,
      (sum, progress) => sum + progress.reviewCount,
    );

    // 计算总学习时间
    final totalTime = history.fold<Duration>(
      Duration.zero,
      (sum, progress) => sum + progress.totalStudyTime,
    );

    // 计算平均掌握度
    final avgMastery = history.isEmpty
        ? 0.0
        : history.fold<double>(
              0,
              (sum, progress) => sum + progress.masteryLevel,
            ) /
            history.length;

    // 统计练习类型分布
    final exerciseTypes = <String, int>{};
    for (var progress in history) {
      progress.exerciseTypeScores.forEach((type, _) {
        exerciseTypes[type] = (exerciseTypes[type] ?? 0) + 1;
      });
    }

    // 生成每日进度数据
    final dailyStats = _generateDailyProgress(history, startDate, endDate);

    return LearningStatistics(
      totalCharactersLearned: learnedCharacters.length,
      totalReviewCount: totalReviews,
      totalStudyTime: totalTime,
      averageMasteryLevel: avgMastery,
      exerciseTypeDistribution: exerciseTypes,
      dailyProgress: dailyStats,
    );
  }

  // 生成每日进度数据
  static List<DailyProgress> _generateDailyProgress(
    List<LearningProgress> history,
    DateTime startDate,
    DateTime endDate,
  ) {
    final dailyProgress = <DailyProgress>[];
    var currentDate = startDate;

    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      final dayProgress = history.where((progress) =>
          progress.lastReviewDate.year == currentDate.year &&
          progress.lastReviewDate.month == currentDate.month &&
          progress.lastReviewDate.day == currentDate.day);

      if (dayProgress.isNotEmpty) {
        dailyProgress.add(
          DailyProgress(
            date: currentDate,
            newCharactersLearned:
                dayProgress.where((p) => p.reviewCount == 1).length,
            reviewsCompleted: dayProgress.length,
            averageMasteryLevel:
                dayProgress.fold<double>(0, (sum, p) => sum + p.masteryLevel) /
                    dayProgress.length,
            studyTime: dayProgress.fold<Duration>(
                Duration.zero, (sum, p) => sum + p.totalStudyTime),
          ),
        );
      } else {
        dailyProgress.add(
          DailyProgress(
            date: currentDate,
            newCharactersLearned: 0,
            reviewsCompleted: 0,
            averageMasteryLevel: 0,
            studyTime: Duration.zero,
          ),
        );
      }

      currentDate = currentDate.add(const Duration(days: 1));
    }

    return dailyProgress;
  }

  // 获取学习趋势分析
  Map<String, dynamic> getLearningTrends() {
    if (dailyProgress.isEmpty) {
      return {
        'trend': 'no_data',
        'recommendation': '开始您的学习之旅吧！',
      };
    }

    // 计算最近7天的平均值
    final recentDays = dailyProgress.length >= 7
        ? dailyProgress.sublist(dailyProgress.length - 7)
        : dailyProgress;

    final avgDailyNew = recentDays.fold<double>(
            0, (sum, day) => sum + day.newCharactersLearned) /
        recentDays.length;

    final avgDailyReviews =
        recentDays.fold<double>(0, (sum, day) => sum + day.reviewsCompleted) /
            recentDays.length;

    // 分析学习趋势
    String trend;
    String recommendation;

    if (avgDailyNew < 2) {
      trend = 'slow_progress';
      recommendation = '建议每天学习更多新字符，保持学习动力！';
    } else if (avgDailyReviews < avgDailyNew * 3) {
      trend = 'review_needed';
      recommendation = '复习次数较少，建议增加复习频率以提高记忆效果。';
    } else if (averageMasteryLevel < 70) {
      trend = 'mastery_improvement_needed';
      recommendation = '建议在学习新字符前，先提高已学字符的掌握度。';
    } else {
      trend = 'good_progress';
      recommendation = '学习进度良好，继续保持！';
    }

    return {
      'trend': trend,
      'recommendation': recommendation,
      'average_daily_new': avgDailyNew,
      'average_daily_reviews': avgDailyReviews,
    };
  }
}

class DailyProgress {
  final DateTime date;
  final int newCharactersLearned;
  final int reviewsCompleted;
  final double averageMasteryLevel;
  final Duration studyTime;

  const DailyProgress({
    required this.date,
    required this.newCharactersLearned,
    required this.reviewsCompleted,
    required this.averageMasteryLevel,
    required this.studyTime,
  });
}
