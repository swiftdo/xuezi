import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/learned_character.dart';
import '../repositories/character_repository.dart';

class GetLearnedCharacters
    implements UseCase<List<LearnedCharacter>, NoParams> {
  final CharacterRepository repository;

  GetLearnedCharacters(this.repository);

  @override
  Future<Either<Failure, List<LearnedCharacter>>> call(NoParams params) {
    return repository.getLearnedCharacters();
  }
}
