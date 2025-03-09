import 'package:dartz/dartz.dart';
import '../entities/learned_character.dart';
import '../../core/error/failures.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<LearnedCharacter>>> getLearnedCharacters();
  Future<Either<Failure, LearnedCharacter>> saveLearnedCharacter(
      String character);
}
