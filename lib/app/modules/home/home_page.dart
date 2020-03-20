import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  //use 'controller' variable to access controller

  AnimationController animationController;
  Animation pokeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..forward();

    var animationTween = Tween(
      begin: -0.025,
      end: 0.025,
    ).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    pokeAnimation = animationTween;
    controller.fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildBackground(),
        _buildSplash(),
      ],
    );
  }

  Container _buildSplash() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: pokeAnimation,
            builder: (context, child) {
              return Transform.rotate(angle: pokeAnimation.value, child: child);
            },
            child: AspectRatio(
              aspectRatio: 1.5,
              child: Image.asset('assets/images/pokebola_real.png'),
            ),
          ),
          SizedBox(height: 10),
          AnimatedBuilder(
            animation: pokeAnimation,
            builder: (context, child) {
              return Transform.scale(
                  scale: 1 + (pokeAnimation.value * 0.2), child: child);
            },
            child: AspectRatio(
              aspectRatio: 3.5,
              child: Image.asset('assets/images/pokemon-logo.png'),
            ),
          )
        ],
      ),
    );
  }

  Container _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Colors.blue,
            Colors.lightBlue,
            Colors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Opacity(
        opacity: 0.4,
        child: Image.asset(
          'assets/images/poke_fundo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
