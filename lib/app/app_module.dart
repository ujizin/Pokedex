import 'package:PokedexFlutter/app/modules/home/home_module.dart';
import 'package:PokedexFlutter/app/modules/pokemon/pokemon_module.dart';
import 'package:PokedexFlutter/app/repository/pokemons_repository.dart';
import 'package:PokedexFlutter/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:PokedexFlutter/app/app_widget.dart';

import 'modules/splash/splash_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokemonsRepository()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: SplashModule()),
        Router(
          "/home",
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
        Router("/pokemon", module: PokemonModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
