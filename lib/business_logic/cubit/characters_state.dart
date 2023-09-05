part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}
final class Charactersloaded extends CharactersState {
  final List<Character> characters;

  Charactersloaded(this.characters);
}
