import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pokemon_controller.dart';

class PokemonPage extends StatefulWidget {
  final String title;
  final int id;
  const PokemonPage({Key key, this.title = "Pokemon", this.id})
      : super(key: key);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends ModularState<PokemonPage, PokemonController> {
  @override
  void initState() {
    super.initState();
    //controller.;
  }
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
