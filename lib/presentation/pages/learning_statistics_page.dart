import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
import '../../domain/entities/learning_record.dart';
import '../bloc/learning_statistics_bloc.dart';
import '../theme/app_colors.dart';
import '../../injection.dart';

class LearningStatisticsPage extends StatelessWidget {
  final String planId;

  const LearningStatisticsPage({super.key, required this.planId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LearningStatisticsBloc>()
        ..add(LearningStatisticsEvent.started(planId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('学习统计'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<LearningStatisticsBloc, LearningStatisticsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text('错误：$message')),
              loaded: (totalStudyTime, characterMasteryCounts) =>
                  SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryCards(totalStudyTime, characterMasteryCounts),
                    const SizedBox(height: 24),
                    _buildMasteryDistribution(characterMasteryCounts),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSummaryCards(
      Duration totalStudyTime, Map<String, int> characterMasteryCounts) {
    final totalCharacters = characterMasteryCounts.length;
    final masteredCharacters =
        characterMasteryCounts.values.where((count) => count >= 2).length;
    final needReviewCharacters =
        characterMasteryCounts.values.where((count) => count <= 0).length;

    final averageTimePerCharacter = totalCharacters == 0
        ? Duration.zero
        : Duration(minutes: totalStudyTime.inMinutes ~/ totalCharacters);

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
              value:
                  '${totalStudyTime.inHours}小时${totalStudyTime.inMinutes % 60}分钟',
              icon: Icons.timer,
              color: AppColors.primary,
            ),
            _buildSummaryCard(
              title: '已掌握汉字',
              value: '$masteredCharacters个',
              icon: Icons.check_circle,
              color: AppColors.accent,
            ),
            _buildSummaryCard(
              title: '需要复习',
              value: '$needReviewCharacters个',
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

  Widget _buildMasteryDistribution(Map<String, int> characterMasteryCounts) {
    final categories = {
      '熟练': characterMasteryCounts.values.where((v) => v >= 3).length,
      '掌握': characterMasteryCounts.values.where((v) => v == 2).length,
      '学习中': characterMasteryCounts.values.where((v) => v == 1).length,
      '需要复习': characterMasteryCounts.values.where((v) => v <= 0).length,
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
}
