import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.name, required this.list})
      : super(key: key);
  final String name;
  final List<Pokemon> list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: PageView(children: list.map((e) => Text(e.name)).toList()),
          )
        ],
      ),
    );
  }
}
