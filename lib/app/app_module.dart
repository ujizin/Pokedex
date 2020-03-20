<<<<<<< HEAD
import 'package:PokedexFlutter/app/module/home/home_module.dart';
import 'package:PokedexFlutter/app/repository/pokemons_repository.dart';
=======
>>>>>>> 9168a27d1b1146ed6ca39b72f5e8926ecb7979ad
import 'package:PokedexFlutter/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:PokedexFlutter/app/app_widget.dart';
<<<<<<< HEAD

import 'modules/splash/splash_module.dart';
=======
import 'package:PokedexFlutter/app/modules/home/home_module.dart';
>>>>>>> 9168a27d1b1146ed6ca39b72f5e8926ecb7979ad

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
<<<<<<< HEAD
        Bind((i) => PokemonsRepository()),
=======
>>>>>>> 9168a27d1b1146ed6ca39b72f5e8926ecb7979ad
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
<<<<<<< HEAD
        Router(Modular.initialRoute, module: SplashModule()),
        Router("/home", module: HomeModule()),
=======
        Router(Modular.initialRoute, module: HomeModule()),
>>>>>>> 9168a27d1b1146ed6ca39b72f5e8926ecb7979ad
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
