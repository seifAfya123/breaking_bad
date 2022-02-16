part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class Charactersloaded extends CharactersState {
  List<CharacterClass> Characters;
  Charactersloaded({
    required this.Characters,
  });
}
