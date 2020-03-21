import 'package:PokedexFlutter/app/model/pokemon_model.dart';
import 'package:PokedexFlutter/app/model/resultPokemon_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ipokemons_repository.dart';

class PokemonsRepository extends Disposable implements IPokemonRepository {
  Dio dio = Dio();

  List<PokemonModel> pokemons;

  @override
  Future fetchPokemons() {
    return dio
        .get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=100')
        .then((response) {
      pokemons = ResultPokemonModel.fromJson(response.data).results;
    });
  }

  List<PokemonModel> getPokemons() => pokemons;

  //dispose will be called automatically
  @override
  void dispose() {}
}
