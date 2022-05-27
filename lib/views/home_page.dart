import 'package:flutter/material.dart';
import 'package:pokedex_app/details/details_container.dart';
import '../models/pokemon_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailsArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name),
            onTap: () =>
                onItemTap('/details', DetailsArguments(name: list[index].name)),
          );
        },
      ),
    );
  }
}
