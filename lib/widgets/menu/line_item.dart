import 'package:flutter/material.dart';

import 'package:classe_a_clone/widgets/menu/price.dart';
import 'package:classe_a_clone/widgets/menu/price_promo.dart';

class LineItem extends StatelessWidget {
  final bool? mostOrdered;
  final bool? weekForSale;
  final bool? recommended;
  final bool? isDestaque;
  final String title;
  final String subtitle;
  final String price;
  final String? priceText;
  final String? promoPrice;
  final String? promoText;
  final String imagePath;
  const LineItem({
    Key? key,
    this.mostOrdered,
    this.weekForSale,
    this.recommended,
    this.isDestaque,
    required this.title,
    required this.subtitle,
    required this.price,
    this.priceText,
    this.promoPrice,
    this.promoText,
    required this.imagePath,
  }) : super(key: key);

  List<dynamic> getBorderColor() {
    if (mostOrdered == true) {
      return [Colors.deepOrange, 'Mais pedido'];
    }
    if (weekForSale == true) {
      return [Colors.purple[500]!, 'Sugestão da casa'];
    }
    if (recommended == true) {
      return [Colors.lightGreen[700]!, 'Recomendado para você'];
    } else {
      return [Colors.black, 'delicia'];
    }
  }

  @override
  Widget build(BuildContext context) {
    var destaqueArgs = getBorderColor();
    var borderColor = destaqueArgs[0];
    var borderText = destaqueArgs[1];
    return Card(
      color: Colors.grey[900],
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: isDestaque == true
            ? BoxDecoration(
                border: Border(
                  left: BorderSide(width: 1.0, color: borderColor),
                ),
              )
            : BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 25),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      if (promoPrice != null) PricePromo(price),
                      Row(
                        children: [
                          if (priceText != null)
                            Text(
                              priceText!,
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          Price(promoPrice != null ? promoPrice : price),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: imagePath.contains('assets')
                        ? Image.asset(
                            imagePath,
                            fit: BoxFit.fill,
                          )
                        : Image.network(imagePath, fit: BoxFit.fill),
                  ),
                ),
                if (isDestaque != null && isDestaque == true)
                  SizedBox(height: 30),
                if (isDestaque != null && isDestaque == true)
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 10),
                      child: Text(
                        borderText!,
                        style: TextStyle(
                            color: borderColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
