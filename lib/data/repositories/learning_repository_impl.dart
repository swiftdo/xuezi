import '../../domain/entities/learning_unit.dart';
import '../../domain/entities/character.dart';
import '../../domain/repositories/learning_repository.dart';
import '../datasources/learning_local_data_source.dart';

class LearningRepositoryImpl implements LearningRepository {
  final LearningLocalDataSource localDataSource;

  LearningRepositoryImpl({required this.localDataSource});

  @override
  Future<List<LearningUnit>> getBasicUnits() async {
    try {
      return await localDataSource.getBasicUnits();
    } catch (e) {
      // TODO: 处理错误，可能返回 Either 或抛出自定义异常
      rethrow;
    }
  }

  @override
  Future<LearningUnit?> getLearningUnit(String id) async {
    try {
      return await localDataSource.getLearningUnit(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<double> getLearningProgress(String unitId) async {
    try {
      return await localDataSource.getLearningProgress(unitId);
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Future<void> updateLearningProgress(String unitId, double progress) async {
    try {
      await localDataSource.updateLearningProgress(unitId, progress);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> getCompletedUnits() async {
    try {
      return await localDataSource.getCompletedUnits();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<LearningUnit>> getRecommendedUnits() async {
    try {
      final completedUnits = await getCompletedUnits();
      final allUnits = await getBasicUnits();

      return allUnits.where((unit) {
        if (completedUnits.contains(unit.id)) {
          return false;
        }

        if (unit.prerequisites == null || unit.prerequisites!.isEmpty) {
          return true;
        }

        return unit.prerequisites!.every(
          (prereq) => completedUnits.contains(prereq),
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
