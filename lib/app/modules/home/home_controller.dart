import 'package:PokedexFlutter/app/model/pokemon_model.dart';
import 'package:PokedexFlutter/app/repository/ipokemons_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  IPokemonRepository pokemonsRepository = Modular.get();

  @observable
  List<PokemonModel> listPokemons;

  @observable
  double offset = 0.0;

  @action
  setOffset(double offset) =>
      offset != null ? this.offset = offset * 0.00095 : null;

  @action
  setPokemons(List<PokemonModel> pokemons) => this.listPokemons = pokemons;

  getPokemons() => setPokemons(pokemonsRepository.getPokemons());
}
