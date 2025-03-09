import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../data/repositories/character_repository_impl.dart';
import '../../domain/repositories/character_repository.dart';
import '../../domain/usecases/get_learned_characters.dart';
import '../../domain/usecases/save_learned_character.dart';
import '../../presentation/bloc/character_bloc.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  // Repositories
  getIt.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(),
  );

  // Use cases
  getIt.registerLazySingleton(
    () => GetLearnedCharacters(getIt()),
  );
  getIt.registerLazySingleton(
    () => SaveLearnedCharacter(getIt()),
  );

  // Blocs
  getIt.registerFactory(
    () => CharacterBloc(
      getLearnedCharacters: getIt(),
      saveLearnedCharacter: getIt(),
    ),
  );

  await getIt.init();
}
