import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
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
                  const SizedBox(height: 16),
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

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
        return GridView.count(
          crossAxisCount: crossAxisCount,
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
      },
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
    final sortedDates = dailyStats.keys.toList()..sort();

    if (sortedDates.isEmpty) {
      return const SizedBox();
    }

    final maxCharacters = dailyStats.values
        .map((stats) => stats.charactersLearned)
        .reduce(max)
        .toDouble();
    final maxTime = dailyStats.values
        .map((stats) => stats.totalTime.inMinutes)
        .reduce(max)
        .toDouble();

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
          height: 300,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: maxCharacters / 5,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: AppColors.neutral4,
                  strokeWidth: 1,
                ),
                getDrawingVerticalLine: (value) => FlLine(
                  color: AppColors.neutral4,
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= sortedDates.length) {
                        return const SizedBox();
                      }
                      final date = sortedDates[value.toInt()];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '${date.month}/${date.day}',
                          style: TextStyle(
                            color: AppColors.neutral2,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                    reservedSize: 30,
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
                    reservedSize: 40,
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: AppColors.neutral4),
              ),
              minX: 0,
              maxX: (sortedDates.length - 1).toDouble(),
              minY: 0,
              maxY: maxCharacters + (maxCharacters * 0.1),
              lineBarsData: [
                // 学习汉字数量曲线
                LineChartBarData(
                  spots: List.generate(sortedDates.length, (index) {
                    final date = sortedDates[index];
                    final stats = dailyStats[date]!;
                    return FlSpot(
                      index.toDouble(),
                      stats.charactersLearned.toDouble(),
                    );
                  }),
                  isCurved: true,
                  color: AppColors.primary,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, bar, index) {
                      return FlDotCirclePainter(
                        radius: 4,
                        color: AppColors.primary,
                        strokeWidth: 2,
                        strokeColor: Colors.white,
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.primary.withOpacity(0.1),
                  ),
                ),
                // 学习时间曲线（分钟）
                LineChartBarData(
                  spots: List.generate(sortedDates.length, (index) {
                    final date = sortedDates[index];
                    final stats = dailyStats[date]!;
                    return FlSpot(
                      index.toDouble(),
                      (stats.totalTime.inMinutes.toDouble() *
                          maxCharacters /
                          maxTime),
                    );
                  }),
                  isCurved: true,
                  color: AppColors.accent,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, bar, index) {
                      return FlDotCirclePainter(
                        radius: 4,
                        color: AppColors.accent,
                        strokeWidth: 2,
                        strokeColor: Colors.white,
                      );
                    },
                  ),
                ),
              ],
              extraLinesData: ExtraLinesData(
                horizontalLines: [
                  HorizontalLine(
                    y: records.first.targetCharactersPerDay.toDouble(),
                    color: AppColors.warning.withOpacity(0.5),
                    strokeWidth: 2,
                    dashArray: [5, 5],
                    label: HorizontalLineLabel(
                      show: true,
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 8, bottom: 4),
                      style: TextStyle(
                        color: AppColors.warning,
                        fontSize: 12,
                      ),
                      labelResolver: (line) => '目标: ${line.y.toInt()}字/天',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildChartLegend(AppColors.primary, '学习汉字数'),
            const SizedBox(width: 24),
            _buildChartLegend(AppColors.accent, '学习时间'),
          ],
        ),
      ],
    );
  }

  Widget _buildChartLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: AppColors.neutral2,
            fontSize: 12,
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

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
          Expanded(
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: categories['熟练']!.toDouble(),
                    title: '熟练\n${categories['熟练']}',
                    color: AppColors.success,
                    radius: 60,
                  ),
                  PieChartSectionData(
                    value: categories['掌握']!.toDouble(),
                    title: '掌握\n${categories['掌握']}',
                    color: AppColors.primary,
                    radius: 60,
                  ),
                  PieChartSectionData(
                    value: categories['学习中']!.toDouble(),
                    title: '学习中\n${categories['学习中']}',
                    color: AppColors.accent,
                    radius: 60,
                  ),
                  PieChartSectionData(
                    value: categories['需要复习']!.toDouble(),
                    title: '需要复习\n${categories['需要复习']}',
                    color: AppColors.warning,
                    radius: 60,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
