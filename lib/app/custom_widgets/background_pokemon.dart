import 'package:flutter/material.dart';

class BackgroundPokemon extends StatelessWidget {
  const BackgroundPokemon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
