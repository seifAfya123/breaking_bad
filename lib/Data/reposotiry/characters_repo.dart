import 'package:break_and_bad_v1/Data/Api/character_web_service.dart';
import 'package:break_and_bad_v1/Data/model/character_class.dart';

class CharactersRepo {
  final CharacterWebService characterWebService;

  CharactersRepo(this.characterWebService);
  Future<List<CharacterClass>> getAllCharacters() async {
    final characters = await characterWebService.getAllCharacters();
    return characters.map((e) => CharacterClass.fromJson(e)).toList();
  }
}
