import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_app/details/details_item_list.dart';

import '../models/pokemon_model.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.controller,
      required this.onChangePokemon})
      : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text('#${pokemon.num}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 56.0),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) {
                    onChangePokemon(list[index]);
                  },
                  controller: controller,
                  children: list.map((e) {
                    bool diff = e.name != pokemon.name;
                    return DetailItemListWidget(isDiff: diff, pokemon: e);
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
