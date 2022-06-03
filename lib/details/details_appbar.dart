import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/pokemon_model.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget(
      {Key? key,
      required this.pokemon,
      required this.onBack,
      required this.isOntop})
      : super(key: key);
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOntop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.chevron_left),
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: isOntop ? 0 : 1,
        child: Text(
          pokemon.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
