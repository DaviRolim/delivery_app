import 'package:flutter/material.dart';

class PricePromo extends StatelessWidget {
  final valor;
  const PricePromo(this.valor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'de ',
          style: TextStyle(color: Colors.grey[500], fontSize: 12),
        ),
        Text(
          'R\$ $valor',
          style: TextStyle(
              decoration: TextDecoration.lineThrough,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.redAccent),
        ),
      ],
    );
  }
}
