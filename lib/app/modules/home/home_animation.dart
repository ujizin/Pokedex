import 'package:flutter/material.dart';

class HomeAnimation {
  final Animation<double> list;
  final Animation<double> pokeball;
  final AnimationController _animationController;

  static CurvedAnimation _curvedAnimation(animationController) =>
      CurvedAnimation(parent: animationController, curve: Curves.elasticInOut);

  HomeAnimation(
    this._animationController,
  )   : list = Tween(begin: 1000.0, end: 0.0)
            .animate(_curvedAnimation(_animationController)),
        pokeball = Tween(begin: -1000.0, end: -125.0)
            .animate(_curvedAnimation(_animationController));
}
