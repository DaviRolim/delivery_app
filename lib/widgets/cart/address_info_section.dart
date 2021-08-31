import 'package:flutter/material.dart';

class AddressInfoSection extends StatelessWidget {
  const AddressInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ENDEREÇO PARA ENTREGA',
              style: TextStyle(color: Colors.grey[500]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Rua Golfo de Cadis, 108. Apt 201',
                style: TextStyle(color: Colors.grey[200]),
              ),
            ),
            Text(
              'Empadinhas barnabe - Intermares',
              style: TextStyle(color: Colors.grey[200]),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ALTERAR',
              style: TextStyle(color: Colors.grey[200]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '40m - 1h',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
