import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/repository/character_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';
// implement logic and manage state to navigate to ui
class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
 late List<Character> characters;
  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character>getAllCharater(){
    characterRepository.getAllCharater().then((characters){
      emit(Charactersloaded(characters));
      this.characters=characters;
    });
    return characters;
  }
}
