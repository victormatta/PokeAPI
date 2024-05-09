import 'package:get/get.dart';
import 'package:poke_api/model/poke_model.dart';

class PokeRepository extends GetConnect {
  Future<List<Poke>> getPokeList() async {
    List<Poke> pokeList = [];

    var path = 'https://pokeapi.co/api/v2/pokemon';

    final response = await get(path);

    if(response.statusCode == 200) {
      final data = response.body['results'];

      for (var pokemonData in data) {
        Poke pokemon = Poke.fromJson(pokemonData);
        
        // Obter informações detalhadas do Pokémon para acessar a URL da imagem
        final detailedResponse = await get(pokemon.url!);
        if (detailedResponse.statusCode == 200) {
          final detailedData = detailedResponse.body;
          pokemon.imageUrl = detailedData['sprites']['front_default'];
        }
        
        pokeList.add(pokemon);
      }
    }

    return pokeList;
  }
}