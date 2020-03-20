import 'package:flutter_modular/flutter_modular.dart';

import 'ipokemons_repository.dart';

class PokemonsRepository extends Disposable implements IPokemonRepository {
  @override
  Future fetchPokemons() {
    return null;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
