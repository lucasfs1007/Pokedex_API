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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Pokedex',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list
              .map((e) => PokemonItemWidget(
                    pokemon: e,
                    onTap: (String, DetailsArguments) {},
                  ))
              .toList(),
        ),
      ),
    );
  }
}
