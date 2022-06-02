import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/pokemon_model.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.controller})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 102,
      left: 0,
      right: 0,
      height: 350,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                height: 200,
                width: double.infinity,
                child: PageView(
                  controller: controller,
                  children: list
                      .map(
                        (e) => Image.network(
                          e.Image,
                          height: 100,
                          width: 200,
                          fit: BoxFit.contain,
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
