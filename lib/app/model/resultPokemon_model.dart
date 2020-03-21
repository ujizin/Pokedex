import 'package:PokedexFlutter/app/model/pokemon_model.dart';

class ResultPokemonModel {
  int count;
  String next;
  dynamic previous;
  List<PokemonModel> results;

  ResultPokemonModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ResultPokemonModel.fromJson(Map<String, dynamic> json) {
    return ResultPokemonModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: _parseResult(json['results']),
    );
  }

  static _parseResult(List<dynamic> data) {
    List<PokemonModel> results = new List<PokemonModel>();
    data.forEach((item) {
      results.add(PokemonModel.fromJson(item));
    });
    return results;
  }
}
