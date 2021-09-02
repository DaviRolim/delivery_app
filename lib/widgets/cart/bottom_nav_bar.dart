import 'package:classe_a_clone/models/Order.dart';
import 'package:classe_a_clone/providers/cart_provider.dart';
import 'package:classe_a_clone/providers/order_provider.dart';
import 'package:classe_a_clone/widgets/cart/no_items_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBarCart extends StatelessWidget {
  BottomNavBarCart({Key? key}) : super(key: key);

  final cartProvider = CartProvider.cartProvider;
  final orderProvider = OrderProvider.orderProvider;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, ch) {
      final cart = ref.watch(cartProvider);
      final order = ref.read(orderProvider);
      return cart.items.length > 0
          ? Container(
              height: 42,
              color: Colors.transparent,
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  OrderItem orderItem = OrderItem(
                      id: '1',
                      total: cart.totalPrice,
                      items: cart.items,
                      dateTime: DateTime.now(),
                      status: OrderStatus.PREPARING);
                  order.placeOrder(orderItem);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                  ),
                ),
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
                        style: TextStyle(color: Colors.grey[200], fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            )
          : NoItemsOnCart();
    });
  }
}
