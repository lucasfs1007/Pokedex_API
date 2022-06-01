import 'package:flutter/material.dart';
import 'package:pokedex_app/details/details_container.dart';
import 'package:pokedex_app/erros/failures.dart';
import 'package:pokedex_app/repositories/pokemon_repositories.dart';
import 'package:pokedex_app/views/erro_page.dart';
import 'package:pokedex_app/views/home_page.dart';
import 'package:pokedex_app/views/loading_page.dart';

import '../models/pokemon_model.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {Key? key, required this.repository, required this.onItemTap})
      : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailsArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllpokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage(); //A tela ainda esta carregando
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(
              list: snapshot.data!,
              onItemTap: (String, DetailsArguments) {},
            );
          }

          if (snapshot.hasError) {
            var erroPage = ErroPage(
              erro: (snapshot.error as Failure).message!,
            );
            return erroPage;
          }

          return Container();
        });
  }
}
