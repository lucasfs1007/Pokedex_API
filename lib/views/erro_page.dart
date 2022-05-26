import 'package:flutter/material.dart';

class ErroPage extends StatelessWidget {
  const ErroPage({Key? key, required this.erro}) : super(key: key);
  final String erro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(erro),
    ));
  }
}
