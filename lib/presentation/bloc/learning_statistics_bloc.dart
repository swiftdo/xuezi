import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/repositories/learning_record_repository.dart';

part 'learning_statistics_bloc.freezed.dart';
part 'learning_statistics_event.dart';
part 'learning_statistics_state.dart';

class LearningStatisticsBloc
    extends Bloc<LearningStatisticsEvent, LearningStatisticsState> {
  final LearningRecordRepository _repository;
  String? _currentPlanId;

  LearningStatisticsBloc(this._repository)
      : super(const LearningStatisticsState.initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
      _Started event, Emitter<LearningStatisticsState> emit) async {
    _currentPlanId = event.planId;
    emit(const LearningStatisticsState.loading());

    try {
      final records = await _repository.getLearningRecords();
      final planRecords =
          records.where((r) => r.planId == _currentPlanId).toList();

      // 计算字符掌握情况
      final masteryCounts = <String, int>{};
      for (final record in planRecords) {
        for (final character in record.knownCharacters) {
          masteryCounts[character] = (masteryCounts[character] ?? 0) + 1;
        }
        for (final character in record.unknownCharacters) {
          masteryCounts[character] = (masteryCounts[character] ?? 0) - 1;
        }
      }

      emit(LearningStatisticsState.loaded(
        totalStudyTime: planRecords.fold(
          Duration.zero,
          (total, record) => total + record.totalStudyTime,
        ),
        characterMasteryCounts: masteryCounts,
      ));
    } catch (e) {
      emit(LearningStatisticsState.error(e.toString()));
    }
  }
}
