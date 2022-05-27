import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_app/container/home_container.dart';
import 'package:pokedex_app/repositories/pokemon_repositories.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/')
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(repository: repository);
            },
          );
      },
    );
  }
}
