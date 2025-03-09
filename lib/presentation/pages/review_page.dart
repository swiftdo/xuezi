import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../domain/entities/review_character.dart';
import '../bloc/review_bloc.dart';
import '../theme/app_colors.dart';
import '../../injection.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ReviewBloc>()..add(const ReviewEvent.started()),
      child: const ReviewPageContent(),
    );
  }
}

class ReviewPageContent extends StatefulWidget {
  const ReviewPageContent({super.key});

  @override
  State<ReviewPageContent> createState() => _ReviewPageContentState();
}

class _ReviewPageContentState extends State<ReviewPageContent> {
  final FlutterTts flutterTts = FlutterTts();
  final CardSwiperController controller = CardSwiperController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("zh-CN");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('每日复习'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<ReviewBloc, ReviewState>(
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
                    child: CardSwiper(
                      controller: controller,
                      cardsCount: characters.length,
                      onSwipe: (previousIndex, currentIndex, direction) {
                        if (currentIndex != null) {
                          setState(() {
                            this.currentIndex = currentIndex;
                          });
                          context.read<ReviewBloc>().add(
                                ReviewEvent.characterReviewed(
                                  character:
                                      characters[previousIndex].character,
                                  remembered:
                                      direction == CardSwiperDirection.right,
                                ),
                              );
                        }
                        return true;
                      },
                      isLoop: false,
                      numberOfCardsDisplayed: 3,
                      backCardOffset: const Offset(40, 40),
                      padding: const EdgeInsets.all(24.0),
                      cardBuilder: (context, index, _, __) {
                        return _buildCharacterCard(context, characters[index]);
                      },
                    ),
                  ),
                  _buildControlButtons(characters),
                ],
              );
            },
            error: (message) => Center(
              child: Text('错误：$message'),
            ),
          );
        },
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

  Widget _buildCharacterCard(BuildContext context, ReviewCharacter character) {
    return GestureDetector(
      onTap: () {
        flutterTts.speak(character.character);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Hero(
                      tag: 'character_${character.character}',
                      child: Text(
                        character.character,
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: AppColors.primary,
                                ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.volume_up,
                              size: 16, color: AppColors.neutral3),
                          const SizedBox(width: 4),
                          Text(
                            '点击听发音',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.neutral3,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '向右滑动表示记得，向左滑动表示不记得',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.neutral2,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.help_outline),
                color: AppColors.neutral3,
                onPressed: () => _showHintDialog(context, character),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButtons(List<ReviewCharacter> characters) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'speak',
            onPressed: () {
              if (currentIndex < characters.length) {
                flutterTts.speak(characters[currentIndex].character);
              }
            },
            backgroundColor: AppColors.accent,
            child: const Icon(Icons.volume_up),
          ),
        ],
      ),
    );
  }

  Future<void> _showHintDialog(
      BuildContext context, ReviewCharacter character) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('提示 - ${character.character}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('学习时间：${_formatDate(character.learnedAt)}'),
            const SizedBox(height: 8),
            Text('复习次数：${character.reviewCount}'),
            const SizedBox(height: 8),
            Text('下次复习：${_formatDate(character.nextReviewDate)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('知道了'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}月${date.day}日';
  }

  @override
  void dispose() {
    controller.dispose();
    flutterTts.stop();
    super.dispose();
  }
}
