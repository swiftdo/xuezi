import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failures.dart';
import '../../core/usecase/usecase.dart';
import '../entities/learned_character.dart';
import '../repositories/character_repository.dart';

class SaveLearnedCharacter
    implements UseCase<LearnedCharacter, SaveCharacterParams> {
  final CharacterRepository repository;

  SaveLearnedCharacter(this.repository);

  @override
  Future<Either<Failure, LearnedCharacter>> call(SaveCharacterParams params) {
    return repository.saveLearnedCharacter(params.character);
  }
}

class SaveCharacterParams extends Equatable {
  final String character;

  const SaveCharacterParams({required this.character});

  @override
  List<Object> get props => [character];
}
