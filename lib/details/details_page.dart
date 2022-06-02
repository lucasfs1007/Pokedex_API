import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_app/details/details_appbar.dart';
import 'package:pokedex_app/details/details_list.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.onBack,
      required this.controller})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBarWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          DetailListWidget(
            pokemon: pokemon,
            list: list,
            controller: controller,
          )
        ],
      ),
    );
  }
}
