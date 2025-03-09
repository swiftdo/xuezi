import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_reminder.freezed.dart';

@freezed
class LearningReminder with _$LearningReminder {
  const factory LearningReminder({
    required String id,
    required String title,
    required String message,
    required DateTime scheduledTime,
    required bool isEnabled,
    required List<int> repeatDays, // 0-6 representing Sunday-Saturday
    required ReminderType type,
    required Map<String, dynamic> additionalData,
  }) = _LearningReminder;
}

enum ReminderType { dailyStudy, review, milestone, streak, custom }
