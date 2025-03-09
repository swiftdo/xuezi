import '../../domain/entities/learning_unit.dart';
import '../models/sample_learning_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LearningLocalDataSource {
  final SharedPreferences prefs;

  LearningLocalDataSource({required this.prefs});

  Future<List<LearningUnit>> getBasicUnits() async {
    return SampleLearningData.basicUnits;
  }

  Future<LearningUnit?> getLearningUnit(String id) async {
    final units = await getBasicUnits();
    return units.firstWhere(
      (unit) => unit.id == id,
      orElse: () => throw Exception('Learning unit not found'),
    );
  }

  Future<double> getLearningProgress(String unitId) async {
    return prefs.getDouble('progress_$unitId') ?? 0.0;
  }

  Future<void> updateLearningProgress(String unitId, double progress) async {
    await prefs.setDouble('progress_$unitId', progress);
  }

  Future<List<String>> getCompletedUnits() async {
    return prefs.getStringList('completed_units') ?? [];
  }

  Future<void> markUnitAsCompleted(String unitId) async {
    final completedUnits = await getCompletedUnits();
    if (!completedUnits.contains(unitId)) {
      completedUnits.add(unitId);
      await prefs.setStringList('completed_units', completedUnits);
    }
  }

  Future<void> saveData(String key, String value) async {
    await prefs.setString(key, value);
  }

  String? getData(String key) {
    return prefs.getString(key);
  }

  Future<void> removeData(String key) async {
    await prefs.remove(key);
  }
}
