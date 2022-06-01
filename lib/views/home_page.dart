import 'package:flutter/material.dart';
import 'package:pokedex_app/details/details_container.dart';
import 'package:pokedex_app/widgets/pokemon_item_widget.dart';
import '../models/pokemon_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailsArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          children: list.map((e) => PokemonItemWidget(pokemon: e)).toList(),
        ),
      ),
    );
  }
}
