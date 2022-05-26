import 'package:flutter/material.dart';
import 'package:pokedex_app/container/home_container.dart';
import 'package:pokedex_app/repositories/pokemon_repositories.dart';
import 'package:pokedex_app/views/home_page.dart';

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
      home: HomeContainer(
        repository: PokemonRepository(),
      ),
    );
  }
}
