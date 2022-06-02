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
  DetailsArguments({this.index = 0, required this.pokemon});
  final Pokemon pokemon;
  final int? index;
}

class DetailsContainer extends StatefulWidget {
  const DetailsContainer({
    Key? key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  }) : super(key: key);
  final IPokemonRepository repository;
  final DetailsArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(
        viewportFraction: 0.5, initialPage: widget.arguments.index!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: widget.repository.getAllpokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage(); //A tela ainda esta carregando
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailPage(
              pokemon: widget.arguments.pokemon,
              list: snapshot.data!,
              onBack: widget.onBack,
              controller: controller,
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
