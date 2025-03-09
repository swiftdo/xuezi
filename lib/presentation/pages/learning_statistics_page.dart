import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../domain/entities/learning_record.dart';
import '../bloc/learning_statistics_bloc.dart';
import '../theme/app_colors.dart';

class LearningStatisticsPage extends StatelessWidget {
  const LearningStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningStatisticsBloc, LearningStatisticsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('学习统计'),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          body: state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text('错误：$message')),
            loaded: (records, masteryCount) => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSummaryCards(records),
                  const SizedBox(height: 24),
                  _buildLearningTrendChart(records),
                  const SizedBox(height: 24),
                  _buildMasteryDistribution(masteryCount),
                  const SizedBox(height: 24),
                  _buildRecentRecords(records),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummaryCards(List<LearningRecord> records) {
    final totalTime = records.fold<Duration>(
      Duration.zero,
      (sum, record) => sum + record.totalStudyTime,
    );

    final totalKnownCharacters =
        records.expand((record) => record.knownCharacters).toSet().length;

    final totalUnknownCharacters =
        records.expand((record) => record.unknownCharacters).toSet().length;

    final averageTimePerCharacter = records.isEmpty
        ? Duration.zero
        : Duration(
            minutes: totalTime.inMinutes ~/
                (totalKnownCharacters + totalUnknownCharacters));

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildSummaryCard(
          title: '总学习时间',
          value: '${totalTime.inHours}小时${totalTime.inMinutes % 60}分钟',
          icon: Icons.timer,
          color: AppColors.primary,
        ),
        _buildSummaryCard(
          title: '已掌握汉字',
          value: '$totalKnownCharacters个',
          icon: Icons.check_circle,
          color: AppColors.accent,
        ),
        _buildSummaryCard(
          title: '需要复习',
          value: '$totalUnknownCharacters个',
          icon: Icons.refresh,
          color: AppColors.warning,
        ),
        _buildSummaryCard(
          title: '平均时间/字',
          value: '${averageTimePerCharacter.inMinutes}分钟',
          icon: Icons.speed,
          color: AppColors.success,
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: AppColors.neutral2,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: AppColors.neutral1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningTrendChart(List<LearningRecord> records) {
    if (records.isEmpty) {
      return const SizedBox();
    }

    final dailyStats = _calculateDailyStats(records);
    final spots = dailyStats.entries
        .map((e) => FlSpot(
              e.key.millisecondsSinceEpoch.toDouble(),
              e.value.charactersLearned.toDouble(),
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '学习趋势',
          style: TextStyle(
            color: AppColors.neutral1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final date =
                          DateTime.fromMillisecondsSinceEpoch(value.toInt());
                      return Text(
                        '${date.month}/${date.day}',
                        style: TextStyle(
                          color: AppColors.neutral2,
                          fontSize: 12,
                        ),
                      );
                    },
                    interval: 24 * 3600 * 1000,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: TextStyle(
                          color: AppColors.neutral2,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.5),
                      AppColors.primary,
                    ],
                  ),
                  barWidth: 3,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withOpacity(0.1),
                        AppColors.primary.withOpacity(0.2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMasteryDistribution(Map<String, int> masteryCount) {
    final categories = {
      '熟练': masteryCount.values.where((v) => v >= 3).length,
      '掌握': masteryCount.values.where((v) => v == 2).length,
      '学习中': masteryCount.values.where((v) => v == 1).length,
      '需要复习': masteryCount.values.where((v) => v <= 0).length,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '掌握程度分布',
          style: TextStyle(
            color: AppColors.neutral1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...categories.entries.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${e.key} (${e.value}个)',
                    style: TextStyle(
                      color: AppColors.neutral2,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: categories.values.fold(0, (a, b) => a + b) == 0
                        ? 0
                        : e.value / categories.values.fold(0, (a, b) => a + b),
                    backgroundColor: AppColors.neutral4,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getMasteryColor(e.key),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildRecentRecords(List<LearningRecord> records) {
    final recentRecords = records.take(5).toList()
      ..sort((a, b) => b.endTime.compareTo(a.endTime));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '最近学习记录',
          style: TextStyle(
            color: AppColors.neutral1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...recentRecords.map((record) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: Text(
                  '${record.knownCharacters.length + record.unknownCharacters.length}个汉字',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '学习时间：${record.totalStudyTime.inMinutes}分钟',
                ),
                trailing: Text(
                  _formatDate(record.endTime),
                  style: TextStyle(
                    color: AppColors.neutral2,
                    fontSize: 12,
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Color _getMasteryColor(String category) {
    switch (category) {
      case '熟练':
        return AppColors.success;
      case '掌握':
        return AppColors.primary;
      case '学习中':
        return AppColors.accent;
      case '需要复习':
        return AppColors.warning;
      default:
        return AppColors.neutral3;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.month}月${date.day}日 ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class _DailyStats {
  final int charactersLearned;
  final Duration totalTime;

  _DailyStats(this.charactersLearned, this.totalTime);
}

Map<DateTime, _DailyStats> _calculateDailyStats(List<LearningRecord> records) {
  final dailyStats = <DateTime, _DailyStats>{};

  for (final record in records) {
    final date = DateTime(
      record.startTime.year,
      record.startTime.month,
      record.startTime.day,
    );

    final charactersLearned =
        record.knownCharacters.length + record.unknownCharacters.length;
    final existingStats = dailyStats[date];

    if (existingStats == null) {
      dailyStats[date] = _DailyStats(charactersLearned, record.totalStudyTime);
    } else {
      dailyStats[date] = _DailyStats(
        existingStats.charactersLearned + charactersLearned,
        existingStats.totalTime + record.totalStudyTime,
      );
    }
  }

  return dailyStats;
}
