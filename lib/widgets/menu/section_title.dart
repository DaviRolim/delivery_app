import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String sectionTitle;
  const SectionTitle({required this.sectionTitle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            sectionTitle,
            style: TextStyle(
                color: Colors.blueGrey[200],
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}
