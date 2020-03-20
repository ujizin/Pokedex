import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import 'ipokemons_repository.dart';

class PokemonsRepository implements IPokemonRepository extends Disposable {

  @override
  Future fetchPokemons() {
  
  }

  //dispose will be called automatically
  @override
  void dispose() {}

}


