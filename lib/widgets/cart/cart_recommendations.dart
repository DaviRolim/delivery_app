import 'package:classe_a_clone/data/items.dart';
import 'package:classe_a_clone/screens/add_to_cart_screen.dart';
import 'package:classe_a_clone/widgets/menu/line_item.dart';
import 'package:flutter/material.dart';

class CartRecommendations extends StatelessWidget {
  const CartRecommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUEM COMPROU ESTES ITENS TAMBÉM PEDIU:',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.grey[200]),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // shrinkWrap: true,
            children: [
              ...MockedItems.destaques
                  .map(
                    (item) => InkWell(
                      onTap: () {
                        // ref.read(cartProvider).addItemToCart(item);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return AddToCartScreen(item, 1);
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 240,
                        height: 150,
                        child: LineItem(
                          title: item.name,
                          subtitle: item.description,
                          price: item.price > 0 ? '${item.price}' : '--',
                          imagePath: item.imageUrl!,
                          // isDestaque: true,
                          // recommended: item.recommended,
                          // mostOrdered: item.mostOrdered,
                          // weekForSale: item.weekForSale,
                          promoPrice: item.forSalePrice != null
                              ? '${item.forSalePrice}'
                              : null,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
