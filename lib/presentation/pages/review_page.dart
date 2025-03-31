import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/review_character.dart';
import '../bloc/review_bloc.dart';
import '../theme/app_colors.dart';
import '../../injection.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ReviewBloc>()..add(const ReviewEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('每日复习'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        body: BlocConsumer<ReviewBloc, ReviewState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (characters, totalReviewed, totalRemembered) {
                if (characters.isEmpty) {
                  return const Center(
                    child: Text('今天没有需要复习的字'),
                  );
                }
                return Column(
                  children: [
                    _buildProgressIndicator(totalReviewed, totalRemembered),
                    Expanded(
                      child: _buildReviewList(context, characters),
                    ),
                  ],
                );
              },
              error: (message) => Center(
                child: Text('错误：$message'),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            switch (index) {
              case 0:
                context.go('/');
                break;
              case 1:
                context.go('/review');
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '计划',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.refresh),
              label: '复习',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(int totalReviewed, int totalRemembered) {
    final progress = totalReviewed == 0 ? 0.0 : totalRemembered / totalReviewed;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: value,
                        backgroundColor: AppColors.neutral4,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          value >= 0.8 ? AppColors.success : AppColors.primary,
                        ),
                        strokeWidth: 8,
                      ),
                      Text(
                        '${(value * 100).toInt()}%',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: value >= 0.8
                                      ? AppColors.success
                                      : AppColors.primary,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '复习进度',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '$totalRemembered/$totalReviewed',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.neutral2,
                        ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviewList(
      BuildContext context, List<ReviewCharacter> characters) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            title: Text(
              character.character,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.primary,
                  ),
            ),
            subtitle: Text(
              '上次学习：${_formatDate(character.learnedAt)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.check_circle_outline),
                  color: AppColors.success,
                  onPressed: () {
                    context.read<ReviewBloc>().add(
                          ReviewEvent.characterReviewed(
                            character: character.character,
                            remembered: true,
                          ),
                        );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.highlight_off),
                  color: AppColors.warning,
                  onPressed: () {
                    context.read<ReviewBloc>().add(
                          ReviewEvent.characterReviewed(
                            character: character.character,
                            remembered: false,
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}月${date.day}日';
  }
}
