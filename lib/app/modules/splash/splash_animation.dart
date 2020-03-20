import 'dart:math';

import 'package:flutter/animation.dart';

class SplashAnimation {
  final AnimationController _loaderController;
  final AnimationController _rollAnimationController;
  final AnimationController _finishAnimationController;
  final Animation<double> pokeWaiting;
  final Animation<double> pokeRoll;
  final Animation<double> pokeTitle;
  final Animation<double> downToUp;
  final Animation<double> upToDown;

  SplashAnimation(
    this._loaderController,
    this._rollAnimationController,
    this._finishAnimationController,
  )   : pokeWaiting = Tween<double>(
          begin: -0.225,
          end: 0.225,
        ).animate(
          CurvedAnimation(
            parent: _loaderController,
            curve: Curves.elasticInOut,
          ),
        ),
        pokeRoll = Tween<double>(
          begin: 0.2,
          end: pi * 2,
        ).animate(_rollAnimationController),
        pokeTitle = Tween<double>(
          begin: 1,
          end: 1.025,
        ).animate(_loaderController),
        downToUp = Tween<double>(begin: 0, end: -500).animate(
          CurvedAnimation(
            parent: _finishAnimationController,
            curve: Curves.elasticIn,
          ),
        ),
        upToDown = Tween<double>(begin: 0, end: 500).animate(
          CurvedAnimation(
            parent: _finishAnimationController,
            curve: Curves.elasticIn,
          ),
        ) {
    _loaderController
      ..forward()
      ..addStatusListener(_listenerLoader);
    _rollAnimationController
      ..forward()
      ..addStatusListener(_listenerRepeat);
  }

  void finishAnimation(Function whenFinished, Function afterAnimationFinished) {
    _loaderController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _loaderController.stop();
        _finishAnimationController.forward();
        whenFinished.call();
        _finishAnimationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            afterAnimationFinished.call();
          }
        });
      }
    });
  }

  AnimationStatusListener get _listenerRepeat => (status) {
        if (status == AnimationStatus.completed) {
          _rollAnimationController.repeat();
        }
      };

  AnimationStatusListener get _listenerLoader => (status) {
        if (status == AnimationStatus.completed) {
          _loaderController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _loaderController.forward();
        }
      };
}
