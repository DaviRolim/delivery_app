import 'package:classe_a_clone/data/items.dart';
import 'package:classe_a_clone/providers/cart_provider.dart';
import 'package:classe_a_clone/screens/add_to_cart_screen.dart';
import 'package:classe_a_clone/widgets/cart/no_items_cart.dart';
import 'package:classe_a_clone/widgets/menu/custom_divider.dart';
import 'package:classe_a_clone/widgets/menu/line_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart';
  final cartProvider = CartProvider.cartProvider;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, ref, child) {
          final cart = ref.watch(cartProvider);
          if (cart.items.length > 0)
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                  ),
                  SizedBox(height: 10),
                  CustomDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'STATUS DO PEDIDO',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      TextButton(
                        child: Text(
                          'ALTERAR',
                          style: TextStyle(color: Colors.grey[200]),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  ...cart.items.map(
                    (cartItem) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${cartItem.quantity}x ${cartItem.item.name} (R\$${(cartItem.item.price * cartItem.quantity).toStringAsFixed(2)})',
                          style: TextStyle(color: Colors.grey[200]),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey[400],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomDivider(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SUBTOTAL',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Text(
                        'R\$${cart.totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TAXA DE ENTREGA',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Text(
                        'R\$10.00',
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Text(
                        'R\$${(cart.totalPrice + 10).toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  CustomDivider(),
                  SizedBox(height: 25),
                  Row(
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
                  ),
                  SizedBox(height: 25),
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
                                        return AddToCartScreen(item);
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
                                    price:
                                        item.price > 0 ? '${item.price}' : '--',
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ),
                    child: Container(
                      height: 42,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'R\$${(cart.totalPrice + 10).toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.grey[200]),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            color: Colors.grey[300],
                            height: 35,
                            width: 1,
                          ),
                          Expanded(
                            child: Text(
                              'AVANÇAR',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[200], fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          return NoItemsOnCart();
        },
      ),
    );
  }
}
