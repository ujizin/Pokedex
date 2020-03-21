import 'package:PokedexFlutter/app/custom_widgets/background_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transparent_image/transparent_image.dart';
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
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..forward();

    _scrollController = ScrollController()
      ..addListener(() {
        controller.setOffset(_scrollController?.offset);
      });

    homeAnimation = HomeAnimation(animationController);
    controller.getPokemons();
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
      child: Observer(builder: (_) {
        var pokemons = controller.listPokemons;
        return pokemons != null
            ? ListWheelScrollView.useDelegate(
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                itemExtent: 125,
                perspective: 0.002,
                offAxisFraction: -0.5,
                squeeze: 0.85,
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: List.generate(
                    controller.listPokemons.length,
                    (index) {
                      int pokemonID = index + 1;
                      return GestureDetector(
                        onTap: () {
                          print("Ta funfando?");
                          Modular.to.pushNamed('/pokemon/$pokemonID');
                        },
                        child: Card(
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: _borderCard(),
                          ),
                          margin: EdgeInsets.only(left: 50),
                          child: Stack(
                            children: <Widget>[
                              _backgroundPokemon(),
                              Row(
                                children: <Widget>[
                                  _imagePokemon(pokemonID),
                                  _pokemonDetails(pokemonID, pokemons[index]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : Container();
      }),
    );
  }

  Container _pokemonDetails(id, pokemon) {
    return Container(
      margin: EdgeInsets.only(left: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _pokemonTitle(id, pokemon),
      ),
    );
  }

  List<Widget> _pokemonTitle(id, pokemon) {
    return [
      Text(
        _formatNumber(id),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: Colors.black,
        ),
        textAlign: TextAlign.start,
      ),
      SizedBox(height: 2),
      Text(
        capitalize(pokemon.name),
        style: TextStyle(
          fontSize: 22.5,
        ),
      )
    ];
  }

  capitalize(name) => "${name[0].toUpperCase()}${name.substring(1)}";

  String _formatNumber(index) {
    int zeroLength = 3 - index.toString().length;
    String zero = "";
    for (var i = 0; i < zeroLength; i++) {
      zero += "0";
    }
    return "#$zero$index";
  }

  FadeInImage _imagePokemon(int id) {
    return FadeInImage.memoryNetwork(
      image:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png",
      placeholder: kTransparentImage,
      width: 125,
      height: 125,
      fadeInDuration: Duration(milliseconds: 100),
      fit: BoxFit.contain,
    );
  }

  BorderRadius _borderCard() {
    return BorderRadius.only(
      topLeft: Radius.circular(15),
      bottomLeft: Radius.circular(15),
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

  _backgroundPokemon() => Container(
        decoration: BoxDecoration(
          borderRadius: _borderCard(),
          gradient: LinearGradient(
            colors: <Color>[
              Colors.red[400],
              Colors.black,
              Colors.grey[300],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 0.4, 0.45],
          ),
        ),
      );
}
