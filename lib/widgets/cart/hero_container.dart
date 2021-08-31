import 'package:flutter/material.dart';

class HeroContainer extends StatelessWidget {
  final String itemId;
  final String imageUrl;
  const HeroContainer({required this.itemId, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Hero(
        tag: itemId,
        child: imageUrl.contains('assets')
            ? Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              )
            : Image.network(imageUrl, fit: BoxFit.fill),
      ),
    );
  }
}
