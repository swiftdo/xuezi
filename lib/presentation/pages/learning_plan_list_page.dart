import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/learning_plan.dart';
import '../../injection.dart';
import '../bloc/learning_plan_bloc.dart';
import '../theme/app_colors.dart';

class LearningPlanListPage extends StatelessWidget {
  const LearningPlanListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<LearningPlanBloc>()..add(const LearningPlanEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('学习计划'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<LearningPlanBloc, LearningPlanState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const Center(child: Text('加载中...')),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text('错误：$message')),
              loaded: (plans) => _buildPlanList(context, plans),
              orElse: () => const SizedBox(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.push('/plan/create'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: const Text('创建计划'),
        ),
      ),
    );
  }

  Widget _buildPlanList(BuildContext context, List<LearningPlan> plans) {
    if (plans.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note_alt_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('还没有学习计划\n点击下方按钮创建一个吧！',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        return _buildPlanCard(context, plan);
      },
    );
  }

  Widget _buildPlanCard(BuildContext context, LearningPlan plan) {
    final now = DateTime.now();
    final progress = now.difference(plan.startDate).inDays /
        plan.endDate.difference(plan.startDate).inDays;
    final isActive = plan.isActive && now.isBefore(plan.endDate);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${_formatDate(plan.startDate)} - ${_formatDate(plan.endDate)}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isActive ? Colors.green[100] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isActive ? '进行中' : '已结束',
                    style: TextStyle(
                      color: isActive ? Colors.green[700] : Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => context.push('/plan/edit/${plan.id}'),
                  tooltip: '编辑',
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _showDeleteConfirmation(context, plan),
                  tooltip: '删除',
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                isActive ? AppColors.primary : Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '目标：${plan.targetCharactersPerDay}字/天',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  '时间：${plan.targetStudyTimePerDay.inMinutes}分钟/天',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: plan.selectedCategories.map((category) {
                return Chip(
                  label: Text(category),
                  backgroundColor: Colors.grey[200],
                  labelStyle: const TextStyle(fontSize: 12),
                );
              }).toList(),
            ),
            if (isActive) ...[
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () =>
                        context.push('/plan/${plan.id}/statistics'),
                    icon: const Icon(Icons.bar_chart),
                    label: const Text('统计'),
                  ),
                  const SizedBox(width: 8),
                  TextButton.icon(
                    onPressed: () => context.push('/plan/${plan.id}/learn'),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('开始学习'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _showDeleteConfirmation(
      BuildContext context, LearningPlan plan) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定要删除学习计划"${plan.name}"吗？\n此操作无法撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (result == true) {
      if (!context.mounted) return;
      context
          .read<LearningPlanBloc>()
          .add(LearningPlanEvent.deletePlan(plan.id));
    }
  }
}
