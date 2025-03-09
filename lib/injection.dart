import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/repositories/learning_repository.dart';
import 'data/repositories/learning_repository_impl.dart';
import 'data/datasources/learning_local_data_source.dart';
import 'presentation/bloc/learning_units_bloc.dart';
import 'domain/repositories/learning_plan_repository.dart';
import 'infrastructure/repositories/learning_plan_repository_impl.dart';
import 'domain/repositories/learning_record_repository.dart';
import 'infrastructure/repositories/learning_record_repository_impl.dart';
import 'presentation/bloc/learning_plan_bloc.dart';
import 'presentation/bloc/learning_session_bloc.dart';
import 'domain/entities/learning_plan.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // External
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  // Data sources
  getIt.registerLazySingleton<LearningLocalDataSource>(
    () => LearningLocalDataSource(prefs: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<LearningRepository>(
    () => LearningRepositoryImpl(localDataSource: getIt()),
  );

  getIt.registerLazySingleton<LearningPlanRepository>(
    () => LearningPlanRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<LearningRecordRepository>(
    () => LearningRecordRepositoryImpl(getIt()),
  );

  // BLoCs
  getIt.registerFactory<LearningUnitsBloc>(
    () => LearningUnitsBloc(repository: getIt()),
  );

  getIt.registerFactory<LearningPlanBloc>(
    () => LearningPlanBloc(getIt<LearningPlanRepository>()),
  );

  getIt.registerFactoryParam<LearningSessionBloc, LearningPlan, void>(
    (plan, _) => LearningSessionBloc(plan, getIt<LearningRecordRepository>()),
  );
}
