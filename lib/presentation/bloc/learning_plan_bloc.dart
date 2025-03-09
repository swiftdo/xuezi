import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/learning_plan.dart';
import '../../domain/repositories/learning_plan_repository.dart';

part 'learning_plan_bloc.freezed.dart';
part 'learning_plan_event.dart';
part 'learning_plan_state.dart';

class LearningPlanBloc extends Bloc<LearningPlanEvent, LearningPlanState> {
  final LearningPlanRepository _repository;

  LearningPlanBloc(this._repository)
      : super(const LearningPlanState.initial()) {
    on<_Started>(_onStarted);
    on<_SavePlan>(_onSavePlan);
    on<_UpdatePlan>(_onUpdatePlan);
    on<_DeletePlan>(_onDeletePlan);
  }

  Future<void> _onStarted(
      _Started event, Emitter<LearningPlanState> emit) async {
    emit(const LearningPlanState.loading());
    try {
      final plans = await _repository.getAllPlans();
      emit(LearningPlanState.loaded(plans));
    } catch (e) {
      emit(LearningPlanState.error(e.toString()));
    }
  }

  Future<void> _onSavePlan(
      _SavePlan event, Emitter<LearningPlanState> emit) async {
    try {
      await _repository.savePlan(event.plan);
      final plans = await _repository.getAllPlans();
      emit(LearningPlanState.loaded(plans));
    } catch (e) {
      emit(LearningPlanState.error(e.toString()));
    }
  }

  Future<void> _onUpdatePlan(
      _UpdatePlan event, Emitter<LearningPlanState> emit) async {
    try {
      await _repository.updatePlan(event.plan);
      final plans = await _repository.getAllPlans();
      emit(LearningPlanState.loaded(plans));
    } catch (e) {
      emit(LearningPlanState.error(e.toString()));
    }
  }

  Future<void> _onDeletePlan(
      _DeletePlan event, Emitter<LearningPlanState> emit) async {
    try {
      await _repository.deletePlan(event.id);
      final plans = await _repository.getAllPlans();
      emit(LearningPlanState.loaded(plans));
    } catch (e) {
      emit(LearningPlanState.error(e.toString()));
    }
  }
}
