import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../domain/entities/learning_plan.dart';
import '../../domain/repositories/learning_record_repository.dart';
import '../../injection.dart';
import '../bloc/learning_session_bloc.dart';
import '../theme/app_colors.dart';
import 'dart:math';

class LearningSessionPage extends StatefulWidget {
  final LearningPlan plan;

  const LearningSessionPage({super.key, required this.plan});

  @override
  State<LearningSessionPage> createState() => _LearningSessionPageState();
}

class _LearningSessionPageState extends State<LearningSessionPage> {
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
    return BlocProvider(
      create: (context) => getIt.get<LearningSessionBloc>(param1: widget.plan)
        ..add(const LearningSessionEvent.started()),
      child: BlocConsumer<LearningSessionBloc, LearningSessionState>(
        listener: (context, state) {
          // Handle state changes if needed
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('学习 - ${widget.plan.name}'),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    context.read<LearningSessionBloc>().add(
                          const LearningSessionEvent.paused(),
                        );
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                _buildProgressIndicator(state),
                Expanded(
                  child: CardSwiper(
                    controller: controller,
                    cardsCount: state.characters.length,
                    onSwipe: (previousIndex, currentIndex, direction) {
                      if (currentIndex != null) {
                        setState(() {
                          this.currentIndex = currentIndex;
                        });
                        context.read<LearningSessionBloc>().add(
                              LearningSessionEvent.characterLearned(
                                character: state.characters[previousIndex],
                                isKnown: direction == CardSwiperDirection.right,
                              ),
                            );

                        // Check if this was the last card
                        if (currentIndex >= state.characters.length - 1) {
                          // Show summary dialog after a short delay
                          Future.delayed(const Duration(milliseconds: 500), () {
                            _showEndSessionDialog(context, state);
                          });
                        }
                      }
                      return true;
                    },
                    isLoop: false,
                    numberOfCardsDisplayed: 3,
                    backCardOffset: const Offset(40, 40),
                    padding: const EdgeInsets.all(24.0),
                    cardBuilder: (context, index, _, __) {
                      return _buildCharacterCard(
                          context, state.characters[index]);
                    },
                  ),
                ),
                _buildControlButtons(state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProgressIndicator(LearningSessionState state) {
    final now = DateTime.now();
    final totalTime = state.isActive
        ? now.difference(state.lastResumeTime ?? state.startTime) +
            state.totalStudyTime
        : state.totalStudyTime;

    final timeProgress =
        totalTime.inMinutes / state.plan.targetStudyTimePerDay.inMinutes;
    final characterProgress =
        state.charactersLearned / state.plan.targetCharactersPerDay;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: timeProgress),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  value: value.clamp(0.0, 1.0),
                                  backgroundColor: AppColors.neutral4,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    value >= 1.0
                                        ? AppColors.success
                                        : AppColors.primary,
                                  ),
                                  strokeWidth: 8,
                                ),
                                Text(
                                  '${(value * 100).toInt()}%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: value >= 1.0
                                            ? AppColors.success
                                            : AppColors.primary,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '学习时间',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              '${totalTime.inMinutes}/${state.plan.targetStudyTimePerDay.inMinutes} 分钟',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.neutral2,
                                  ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: characterProgress),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  value: value.clamp(0.0, 1.0),
                                  backgroundColor: AppColors.neutral4,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    value >= 1.0
                                        ? AppColors.success
                                        : AppColors.accent,
                                  ),
                                  strokeWidth: 8,
                                ),
                                Text(
                                  '${(value * 100).toInt()}%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: value >= 1.0
                                            ? AppColors.success
                                            : AppColors.accent,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '学习进度',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              '${state.knownCharacters.length + state.unknownCharacters.length}/${state.plan.targetCharactersPerDay} 个汉字',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.neutral2,
                                  ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (state.knownCharacters.isNotEmpty ||
              state.unknownCharacters.isNotEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '当前学习情况',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _buildMasteryIndicator(
                            context,
                            '已掌握',
                            state.knownCharacters.length,
                            AppColors.success,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildMasteryIndicator(
                            context,
                            '需要复习',
                            state.unknownCharacters.length,
                            AppColors.warning,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMasteryIndicator(
    BuildContext context,
    String label,
    int count,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          '$count',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '个汉字',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.neutral2,
              ),
        ),
      ],
    );
  }

  Widget _buildCharacterCard(BuildContext context, String character) {
    return GestureDetector(
      onTap: () {
        flutterTts.speak(character);
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
                      tag: 'character_$character',
                      child: Text(
                        character,
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
                        '向右滑动表示认识，向左滑动表示不认识',
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

  Widget _buildControlButtons(LearningSessionState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'speak',
            onPressed: () {
              if (currentIndex < state.characters.length) {
                flutterTts.speak(state.characters[currentIndex]);
              }
            },
            backgroundColor: AppColors.accent,
            child: const Icon(Icons.volume_up),
          ),
          FloatingActionButton(
            heroTag: 'end',
            onPressed: () => _showEndSessionDialog(context, state),
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.stop),
          ),
        ],
      ),
    );
  }

  Future<void> _showEndSessionDialog(
      BuildContext context, LearningSessionState state) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('结束学习'),
        content: const Text('确定要结束本次学习吗？'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
              // Replace current page with a new instance
              if (!mounted) return;
              // Create a new bloc and replace the current one
              final newBloc = getIt.get<LearningSessionBloc>(
                  param1: widget.plan)
                ..add(const LearningSessionEvent.started());

              // Replace the bloc
              context.read<LearningSessionBloc>().close();
              setState(() {
                currentIndex = 0;
              });

              // Rebuild the widget tree with the new bloc
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      BlocProvider.value(
                    value: newBloc,
                    child: LearningSessionPage(plan: widget.plan),
                  ),
                  transitionDuration: Duration.zero,
                ),
              );
            },
            child: const Text('继续学习'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('结束'),
          ),
        ],
      ),
    );

    if (result == true) {
      if (!mounted) return;

      context
          .read<LearningSessionBloc>()
          .add(const LearningSessionEvent.endSession());
      await _showSummaryDialog(context, state);
      if (!mounted) return;

      context.go('/');
    }
  }

  Future<void> _showSummaryDialog(
      BuildContext context, LearningSessionState state) {
    final knownCount = state.knownCharacters.length;
    final unknownCount = state.unknownCharacters.length;
    final totalTime = state.isActive
        ? (DateTime.now().difference(state.lastResumeTime!) +
            state.totalStudyTime)
        : state.totalStudyTime;

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('学习总结'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('学习时间：${totalTime.inMinutes} 分钟'),
              const SizedBox(height: 8),
              Text('已掌握：$knownCount 个字'),
              const SizedBox(height: 8),
              Text('需要复习：$unknownCount 个字'),
              const SizedBox(height: 16),
              const Text('学习趋势', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: _buildLearningTrendChart(state),
              ),
              const SizedBox(height: 16),
              const Text('继续保持，明天见！',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  Widget _buildLearningTrendChart(LearningSessionState state) {
    final spots = _generateSpots(state);
    final maxY = spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b);

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: maxY / 5,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: AppColors.neutral4,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: AppColors.neutral4,
              strokeWidth: 1,
            );
          },
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
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  '${value.toInt() + 1}分钟',
                  style: TextStyle(
                    color: AppColors.neutral2,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: maxY / 5,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: AppColors.neutral2,
                    fontSize: 12,
                  ),
                );
              },
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: AppColors.neutral4),
        ),
        minX: 0,
        maxX: spots.length.toDouble() - 1,
        minY: 0,
        maxY: maxY + (maxY * 0.1),
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
            isStrokeCapRound: true,
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
    );
  }

  List<FlSpot> _generateSpots(LearningSessionState state) {
    final spots = <FlSpot>[];
    final now = DateTime.now();
    final totalTime = state.isActive
        ? now.difference(state.lastResumeTime ?? state.startTime) +
            state.totalStudyTime
        : state.totalStudyTime;

    final totalMinutes = totalTime.inMinutes;
    if (totalMinutes == 0) return spots;

    // 计算每分钟的学习进度
    final knownCharacters = state.knownCharacters.length;
    final unknownCharacters = state.unknownCharacters.length;
    final totalCharacters = knownCharacters + unknownCharacters;

    // 计算每分钟的平均学习速度
    final averageRate = totalCharacters / totalMinutes;

    // 生成学习曲线数据点
    for (int i = 0; i < totalMinutes; i++) {
      // 使用指数函数模拟学习曲线，开始快后面慢
      final progress = (1 - exp(-2 * i / totalMinutes)) * totalCharacters;
      spots.add(FlSpot(i.toDouble(), progress));
    }

    // 添加当前进度点
    spots.add(FlSpot(totalMinutes.toDouble(), totalCharacters.toDouble()));

    return spots;
  }

  Future<void> _showHintDialog(BuildContext context, String character) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('提示 - $character'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('部首：${_getRadical(character)}'),
            const SizedBox(height: 8),
            Text('笔画数：${_getStrokeCount(character)}'),
            const SizedBox(height: 8),
            Text('常见组词：${_getCommonWords(character).join('、')}'),
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

  String _getRadical(String character) {
    // TODO: 从数据库获取部首信息
    return '氵';
  }

  int _getStrokeCount(String character) {
    // TODO: 从数据库获取笔画数信息
    return 8;
  }

  List<String> _getCommonWords(String character) {
    // TODO: 从数据库获取常见组词信息
    return ['学习', '学生', '学校'];
  }

  @override
  void dispose() {
    controller.dispose();
    flutterTts.stop();
    super.dispose();
  }
}
