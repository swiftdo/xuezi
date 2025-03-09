import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../../domain/entities/learning_unit.dart';
import '../../domain/entities/character.dart';

class LearningUnitCard extends StatelessWidget {
  final LearningUnit unit;
  final double progress;

  const LearningUnitCard({
    super.key,
    required this.unit,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: AppColors.neutral4.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          final characters = unit.groups
              .expand((group) => group.characters)
              .map((char) => char.character)
              .toList();
          context.push('/detail', extra: {
            'title': unit.name,
            'characters': characters,
          });
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressSection(),
                  const SizedBox(height: 16),
                  _buildGroupPreview(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unit.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  unit.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.neutral3,
                  ),
                ),
              ],
            ),
          ),
          _buildDifficultyBadge(),
        ],
      ),
    );
  }

  Widget _buildDifficultyBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            size: 16,
            color: AppColors.primary,
          ),
          const SizedBox(width: 4),
          Text(
            '难度 ${unit.difficulty}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '学习进度',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.neutral2,
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.neutral4.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.auto_stories,
                  size: 16,
                  color: AppColors.neutral3,
                ),
                const SizedBox(width: 4),
                Text(
                  '目标：${unit.targetCount}字',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.neutral3,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: 16,
                  color: AppColors.neutral3,
                ),
                const SizedBox(width: 4),
                Text(
                  '预计${_formatDuration(unit.estimatedTime)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.neutral3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGroupPreview() {
    final firstGroup = unit.groups.first;
    final previewCharacters = firstGroup.characters.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstGroup.name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.neutral2,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: previewCharacters
              .map((char) => _buildCharacterChip(char))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildCharacterChip(Character character) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.neutral4.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.neutral4.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        character.character,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.neutral1,
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}天';
    }
    if (duration.inHours > 0) {
      return '${duration.inHours}小时';
    }
    return '${duration.inMinutes}分钟';
  }
}
