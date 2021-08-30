import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Sushi Classe A',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400]),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.timer,
                color: Colors.red,
                size: 14,
              ),
              SizedBox(width: 3),
              Text(
                'Abre 11:00',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Entrega a partir de: R\$5.00  40m - 1h',
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(20),
            height: 40,
            color: Colors.black38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.details_rounded,
                  color: Colors.white,
                  size: 12,
                ),
                Text(
                  'Ver mais detalhes do programa',
                  style: TextStyle(color: Colors.grey[200]),
                ),
                Icon(
                  Icons.arrow_right_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
