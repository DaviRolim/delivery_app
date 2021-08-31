import 'package:flutter/material.dart';

class NameSection extends StatelessWidget {
  const NameSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NOME',
              style: TextStyle(color: Colors.grey[500]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Davi Rolim de Paiva Holanda',
                style: TextStyle(color: Colors.grey[200]),
              ),
            )
          ],
        ),
        TextButton(
          child: Text(
            'ALTERAR',
            style: TextStyle(color: Colors.grey[200]),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
