import 'package:PokedexFlutter/app/model/pokemon_model.dart';

abstract class IPokemonRepository {
  Future fetchPokemons();
  List<PokemonModel> getPokemons();
}
