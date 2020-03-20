// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
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
  String toString() {
    final string = 'offset: ${offset.toString()}';
    return '{$string}';
  }
}
