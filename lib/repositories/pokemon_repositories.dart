import 'package:dio/dio.dart';
import 'package:pokedex_app/consts/api_consts.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllpokemons();
}

class PokemonRepository implements IPokemonRepository {
  @override
  Future<List<Pokemon>> getAllpokemons() {}
}
