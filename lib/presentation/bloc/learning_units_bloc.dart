import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/learning_unit.dart';
import '../../domain/repositories/learning_repository.dart';

part 'learning_units_bloc.freezed.dart';
part 'learning_units_event.dart';
part 'learning_units_state.dart';

class LearningUnitsBloc extends Bloc<LearningUnitsEvent, LearningUnitsState> {
  final LearningRepository repository;

  LearningUnitsBloc({required this.repository})
      : super(const LearningUnitsState.initial()) {
    on<LearningUnitsEvent>((event, emit) async {
      await event.map(
        started: (_) async {
          emit(const LearningUnitsState.loading());
          try {
            final units = await repository.getBasicUnits();
            final List<UnitWithProgress> unitsWithProgress = [];

            for (final unit in units) {
              final progress = await repository.getLearningProgress(unit.id);
              unitsWithProgress
                  .add(UnitWithProgress(unit: unit, progress: progress));
            }

            emit(LearningUnitsState.loaded(unitsWithProgress));
          } catch (e) {
            emit(LearningUnitsState.error(e.toString()));
          }
        },
        progressUpdated: (event) async {
          try {
            await repository.updateLearningProgress(
              event.unitId,
              event.progress,
            );
            add(const LearningUnitsEvent.started());
          } catch (e) {
            emit(LearningUnitsState.error(e.toString()));
          }
        },
      );
    });
  }
}
