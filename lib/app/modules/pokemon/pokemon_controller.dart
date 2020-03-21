import 'package:mobx/mobx.dart';

part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {}
