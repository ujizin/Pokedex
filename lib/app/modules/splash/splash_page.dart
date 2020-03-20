import 'package:PokedexFlutter/app/custom_widgets/background_pokemon.dart';
import 'package:PokedexFlutter/app/modules/splash/splash_animation.dart';
import 'package:PokedexFlutter/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController>
    with TickerProviderStateMixin {
  //use 'controller' variable to access controller
  SplashAnimation animator;

  AnimationController loaderAnimation;
  AnimationController rollAnimation;
  AnimationController finishAnimation;

  @override
  void initState() {
    super.initState();
    loaderAnimation = _animationController(Duration(milliseconds: 1500));
    rollAnimation = _animationController(Duration(milliseconds: 500));
    finishAnimation = _animationController(Duration(milliseconds: 2500));

    animator = SplashAnimation(loaderAnimation, rollAnimation, finishAnimation);

    when(
      (_) => controller.finished == true,
      (() {
        animator.finishAnimation(
          () {
            controller.setReady(true);
          },
          () => Modular.to.pushReplacementNamed("/home"),
        );
      }),
    );

    controller.fetchPokemon();
  }

  @override
  void dispose() {
    loaderAnimation.dispose();
    rollAnimation.dispose();
    finishAnimation.dispose();
    super.dispose();
  }

  AnimationController _animationController(Duration duration) =>
      AnimationController(
        duration: duration,
        vsync: this,
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        BackgroundPokemon(),
        _buildSplash(),
      ],
    );
  }

  Container _buildSplash() {
    return Container(
      child: Observer(builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation:
                  controller.ready ? animator.pokeRoll : animator.pokeWaiting,
              builder: (context, child) {
                return controller.ready
                    ? Transform.translate(
                        offset: Offset(0, animator.downToUp.value),
                        child: Transform.rotate(
                          angle: animator.pokeRoll.value,
                          child: child,
                        ))
                    : Transform.rotate(
                        angle: animator.pokeWaiting.value,
                        child: child,
                      );
              },
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Image.asset('assets/images/pokebola_real.png'),
              ),
            ),
            SizedBox(height: 10),
            AnimatedBuilder(
              animation:
                  controller.ready ? animator.upToDown : animator.pokeTitle,
              builder: (context, child) {
                return controller.ready
                    ? Transform.translate(
                        offset: Offset(
                          0.0,
                          animator.upToDown.value,
                        ),
                        child: child,
                      )
                    : Transform.scale(
                        scale: animator.pokeTitle.value,
                        child: child,
                      );
              },
              child: AspectRatio(
                aspectRatio: 3.5,
                child: Image.asset('assets/images/pokemon-logo.png'),
              ),
            )
          ],
        );
      }),
    );
  }
}
