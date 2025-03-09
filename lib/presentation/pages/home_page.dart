import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xuezi/presentation/theme/app_colors.dart';
import '../widgets/learning_unit_card.dart';
import '../bloc/learning_units_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningUnitsBloc, LearningUnitsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('学子'),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.dashboard),
                onPressed: () => context.go('/dashboard'),
              ),
              IconButton(
                icon: const Icon(Icons.event_note),
                onPressed: () => context.go('/plans'),
                tooltip: '学习计划',
              ),
            ],
          ),
          body: state.map(
            initial: (_) => const Center(child: Text('初始化中...')),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (state) => Center(child: Text('错误：${state.message}')),
            loaded: (state) => ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: state.units.length,
              itemBuilder: (context, index) {
                final unitWithProgress = state.units[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: LearningUnitCard(
                    unit: unitWithProgress.unit,
                    progress: unitWithProgress.progress,
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.go('/plan/create'),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            icon: const Icon(Icons.add),
            label: const Text('创建学习计划'),
          ),
        );
      },
    );
  }
}
