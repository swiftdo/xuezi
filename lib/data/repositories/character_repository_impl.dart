import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/learned_character.dart';
import '../../domain/repositories/character_repository.dart';
import '../../infrastructure/database/objectbox/objectbox.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  @override
  Future<Either<Failure, List<LearnedCharacter>>> getLearnedCharacters() async {
    try {
      final box = store.box<LearnedCharacter>();
      final characters = box.getAll();
      return Right(characters);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LearnedCharacter>> saveLearnedCharacter(
      String character) async {
    try {
      final box = store.box<LearnedCharacter>();
      final learnedChar = LearnedCharacter(character: character);
      box.put(learnedChar);
      return Right(learnedChar);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
