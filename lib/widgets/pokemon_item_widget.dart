import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_app/widgets/type_widget.dart';

import '../models/pokemon_model.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pokemon.baseColor!.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pokemon.name),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(pokemon.name),
              Text(pokemon.num),
            ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        pokemon.type.map((e) => TypeWidget(name: e)).toList()),
                Flexible(
                  child: Image.network(pokemon.image),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
