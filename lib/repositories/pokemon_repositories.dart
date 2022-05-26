import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_app/consts/api_consts.dart';
import 'package:pokedex_app/erros/failures.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllpokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllpokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsUrl);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Erro ao carregar os dados');
    }
  }
}
