import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/Pokedex_routes.dart';
import 'package:pokedex_app/container/home_container.dart';
import 'package:pokedex_app/repositories/pokemon_repositories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PokedexRoute(repository: PokemonRepository(dio: Dio())));
  }
}
