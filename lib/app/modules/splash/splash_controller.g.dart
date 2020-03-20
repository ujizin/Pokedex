// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on SplashControllerBase, Store {
  final _$readyAtom = Atom(name: 'SplashControllerBase.ready');

  @override
  bool get ready {
    _$readyAtom.context.enforceReadPolicy(_$readyAtom);
    _$readyAtom.reportObserved();
    return super.ready;
  }

  @override
  set ready(bool value) {
    _$readyAtom.context.conditionallyRunInAction(() {
      super.ready = value;
      _$readyAtom.reportChanged();
    }, _$readyAtom, name: '${_$readyAtom.name}_set');
  }

  final _$finishedAtom = Atom(name: 'SplashControllerBase.finished');

  @override
  bool get finished {
    _$finishedAtom.context.enforceReadPolicy(_$finishedAtom);
    _$finishedAtom.reportObserved();
    return super.finished;
  }

  @override
  set finished(bool value) {
    _$finishedAtom.context.conditionallyRunInAction(() {
      super.finished = value;
      _$finishedAtom.reportChanged();
    }, _$finishedAtom, name: '${_$finishedAtom.name}_set');
  }

  final _$SplashControllerBaseActionController =
      ActionController(name: 'SplashControllerBase');

  @override
  dynamic setReady(dynamic isReady) {
    final _$actionInfo = _$SplashControllerBaseActionController.startAction();
    try {
      return super.setReady(isReady);
    } finally {
      _$SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'ready: ${ready.toString()},finished: ${finished.toString()}';
    return '{$string}';
  }
}
