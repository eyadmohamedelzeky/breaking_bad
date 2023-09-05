import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/web_services/character_web_service.dart';
// take object from CharactersWebServices to make method return data from api
class CharacterRepository {
  CharactersWebServices charactersWebServices;
  CharacterRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharater() async {
    final characters = await charactersWebServices.getAllCharater();

  return characters?.map((character)=>Character.fromjson(character)).toList()??[];
  }
}
