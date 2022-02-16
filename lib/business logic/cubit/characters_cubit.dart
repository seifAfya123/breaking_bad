import 'package:bloc/bloc.dart';
import 'package:break_and_bad_v1/Data/model/character_class.dart';
import 'package:break_and_bad_v1/Data/reposotiry/characters_repo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo char_repo;
  List<CharacterClass> my_characters = [];
  CharactersCubit(this.char_repo) : super(CharactersInitial());

  List<CharacterClass> get_All_characters() {
    char_repo.getAllCharacters().then((characters) {
      emit(Charactersloaded(Characters: characters));
      my_characters = characters;
    });
    return my_characters;
  }
}
