// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listPokemonsAtom = Atom(name: '_HomeControllerBase.listPokemons');

  @override
  List<PokemonModel> get listPokemons {
    _$listPokemonsAtom.context.enforceReadPolicy(_$listPokemonsAtom);
    _$listPokemonsAtom.reportObserved();
    return super.listPokemons;
  }

  @override
  set listPokemons(List<PokemonModel> value) {
    _$listPokemonsAtom.context.conditionallyRunInAction(() {
      super.listPokemons = value;
      _$listPokemonsAtom.reportChanged();
    }, _$listPokemonsAtom, name: '${_$listPokemonsAtom.name}_set');
  }

  final _$offsetAtom = Atom(name: '_HomeControllerBase.offset');

  @override
  double get offset {
    _$offsetAtom.context.enforceReadPolicy(_$offsetAtom);
    _$offsetAtom.reportObserved();
    return super.offset;
  }

  @override
  set offset(double value) {
    _$offsetAtom.context.conditionallyRunInAction(() {
      super.offset = value;
      _$offsetAtom.reportChanged();
    }, _$offsetAtom, name: '${_$offsetAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setOffset(double offset) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setOffset(offset);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokemons(List<PokemonModel> pokemons) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setPokemons(pokemons);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'listPokemons: ${listPokemons.toString()},offset: ${offset.toString()}';
    return '{$string}';
  }
}
