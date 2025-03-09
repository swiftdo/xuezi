import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/usecase/usecase.dart';
import '../../domain/entities/learned_character.dart';
import '../../domain/usecases/get_learned_characters.dart';
import '../../domain/usecases/save_learned_character.dart';

part 'character_bloc.freezed.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetLearnedCharacters getLearnedCharacters;
  final SaveLearnedCharacter saveLearnedCharacter;

  CharacterBloc({
    required this.getLearnedCharacters,
    required this.saveLearnedCharacter,
  }) : super(const CharacterState.initial()) {
    on<CharacterEvent>((event, emit) async {
      await event.map(
        started: (_) async {
          emit(const CharacterState.loading());
          final result = await getLearnedCharacters(NoParams());
          result.fold(
            (failure) => emit(CharacterState.error(failure.toString())),
            (characters) => emit(CharacterState.loaded(characters)),
          );
        },
        saved: (event) async {
          final result = await saveLearnedCharacter(
            SaveCharacterParams(character: event.character),
          );
          result.fold(
            (failure) => emit(CharacterState.error(failure.toString())),
            (_) async {
              final charactersResult = await getLearnedCharacters(NoParams());
              charactersResult.fold(
                (failure) => emit(CharacterState.error(failure.toString())),
                (characters) => emit(CharacterState.loaded(characters)),
              );
            },
          );
        },
      );
    });
  }
}
