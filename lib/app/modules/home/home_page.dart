import 'package:PokedexFlutter/app/custom_widgets/background_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_animation.dart';
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

  ScrollController _scrollController;
  AnimationController animationController;
  HomeAnimation homeAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..forward();

    _scrollController = ScrollController()
      ..addListener(() {
        controller.setOffset(_scrollController?.offset);
      });

    homeAnimation = HomeAnimation(animationController);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackgroundPokemon(),
          _pokeballBackground(),
          _listPokemons(),
        ],
      ),
    );
  }

  _listPokemons() {
    return AnimatedBuilder(
      animation: homeAnimation.list,
      builder: (context, child) {
        return Transform.translate(
            offset: Offset(homeAnimation.list.value, 0), child: child);
      },
      child: ListWheelScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        itemExtent: 200,
        perspective: 0.002,
        offAxisFraction: -0.5,
        squeeze: 0.85,
        children: List.generate(
          100,
          (index) => Container(
            margin: EdgeInsets.only(left: 50),
            color: Colors.amber,
            child: ListTile(
              title: Text("Teste"),
            ),
          ),
        ),
      ),
    );
  }

  _pokeballBackground() {
    return Opacity(
      opacity: 0.75,
      child: Transform.scale(
        scale: 1.5,
        child: AnimatedBuilder(
          animation: homeAnimation.pokeball,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(homeAnimation.pokeball.value, 0),
              child: child,
            );
          },
          child: Observer(builder: (_) {
            return Transform.rotate(
              angle: controller.offset,
              child: Image.asset('assets/images/pokebola.png'),
            );
          }),
        ),
      ),
    );
  }
}
