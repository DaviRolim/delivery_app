import 'package:classe_a_clone/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'orders';
  final cartProvider = CartProvider.cartProvider;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, ref, child) {
          final cart = ref.watch(cartProvider);
          return Text(
            cart.items.length.toString(),
            style: TextStyle(fontSize: 26, color: Colors.white),
          );
        },
      ),
    );
  }
}
