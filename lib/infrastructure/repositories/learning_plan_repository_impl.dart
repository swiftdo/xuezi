import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/learning_plan.dart';
import '../../domain/repositories/learning_plan_repository.dart';

class LearningPlanRepositoryImpl implements LearningPlanRepository {
  final SharedPreferences _prefs;
  static const String _plansKey = 'learning_plans';

  LearningPlanRepositoryImpl(this._prefs);

  @override
  Future<List<LearningPlan>> getAllPlans() async {
    final plansJson = _prefs.getStringList(_plansKey) ?? [];
    return plansJson
        .map((json) => LearningPlan.fromJson(jsonDecode(json)))
        .toList();
  }

  @override
  Future<LearningPlan?> getPlanById(String id) async {
    final plans = await getAllPlans();
    return plans.firstWhere((plan) => plan.id == id);
  }

  @override
  Future<void> savePlan(LearningPlan plan) async {
    final plans = await getAllPlans();
    plans.add(plan);
    await _savePlans(plans);
  }

  @override
  Future<void> deletePlan(String id) async {
    final plans = await getAllPlans();
    plans.removeWhere((plan) => plan.id == id);
    await _savePlans(plans);
  }

  @override
  Future<void> updatePlan(LearningPlan plan) async {
    final plans = await getAllPlans();
    final index = plans.indexWhere((p) => p.id == plan.id);
    if (index != -1) {
      plans[index] = plan;
      await _savePlans(plans);
    }
  }

  @override
  Future<List<LearningPlan>> getActivePlans() async {
    final plans = await getAllPlans();
    return plans.where((plan) => plan.isActive).toList();
  }

  Future<void> _savePlans(List<LearningPlan> plans) async {
    final plansJson = plans.map((plan) => jsonEncode(plan.toJson())).toList();
    await _prefs.setStringList(_plansKey, plansJson);
  }
}
