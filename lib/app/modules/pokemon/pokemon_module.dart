import 'package:PokedexFlutter/app/modules/pokemon/pokemon_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PokedexFlutter/app/modules/pokemon/pokemon_page.dart';

class PokemonModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokemonController()),
      ];

  @override
  List<Router> get routers => [
        Router('/:id',
            child: (_, args) => PokemonPage(id: int.parse(args.data["id"]))),
      ];

  static Inject get to => Inject<PokemonModule>.of();
}
