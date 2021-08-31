import 'package:classe_a_clone/providers/cart_provider.dart';
import 'package:classe_a_clone/screens/add_to_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListCartItems extends StatelessWidget {
  ListCartItems({Key? key}) : super(key: key);

  final cartProvider = CartProvider.cartProvider;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final cart = ref.watch(cartProvider);
      return Column(
        children: [
          ...cart.items.map(
            (cartItem) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '${cartItem.quantity}x ${cartItem.item.name} (R\$${(cartItem.item.price * cartItem.quantity).toStringAsFixed(2)})',
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey[400],
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return AddToCartScreen(
                                cartItem.item,
                                cartItem.quantity,
                                editMode: true,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[200],
                      ),
                      onPressed: () => cart.deleteItem(cartItem),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
