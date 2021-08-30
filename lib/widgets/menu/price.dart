import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final valor;
  const Price(this.valor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'R\$ $valor',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.blueGrey[200]),
    );
  }
}
