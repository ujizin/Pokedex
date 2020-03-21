import 'package:PokedexFlutter/app/repository/ipokemons_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  IPokemonRepository repository = Modular.get();

  @observable
  bool ready = false;

  @observable
  bool finished = false;

  @action
  setReady(isReady) => ready = isReady;

  @action
  setFinished(isFinished) => finished = isFinished;

  fetchPokemon() async {
    await repository.fetchPokemons();
    Future.delayed(Duration(seconds: 1)).then((_) {
      setFinished(true);
    });
  }
}
