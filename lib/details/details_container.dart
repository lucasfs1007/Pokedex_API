import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_app/erros/failures.dart';
import 'package:pokedex_app/repositories/pokemon_repositories.dart';
import 'package:pokedex_app/views/erro_page.dart';

import '../models/pokemon_model.dart';
import '../views/loading_page.dart';
import 'details_page.dart';

class DetailsArguments {
  DetailsArguments({required this.name});
  final String name;
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer(
      {Key? key, required this.repository, required this.arguments})
      : super(key: key);
  final IPokemonRepository repository;
  final DetailsArguments arguments;
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
            return DetailsPage(
              name: arguments.name,
              list: snapshot.data!,
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
