import 'package:classe_a_clone/providers/cart_provider.dart';
import 'package:classe_a_clone/widgets/cart/address_info_section.dart';
import 'package:classe_a_clone/widgets/cart/bottom_nav_bar.dart';
import 'package:classe_a_clone/widgets/cart/cart_recommendations.dart';
import 'package:classe_a_clone/widgets/cart/list_cart_items.dart';
import 'package:classe_a_clone/widgets/cart/name_section.dart';
import 'package:classe_a_clone/widgets/cart/no_items_cart.dart';
import 'package:classe_a_clone/widgets/menu/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart';
  final cartProvider = CartProvider.cartProvider;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: SingleChildScrollView(
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
                        NameSection(),
                        SizedBox(height: 10),
                        CustomDivider(),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'STATUS DO PEDIDO',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ],
                        ),
                        ListCartItems(),
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
                        AddressInfoSection(),
                        SizedBox(height: 25),
                        CartRecommendations(),
                      ],
                    ),
                  );
                return NoItemsOnCart();
              },
            ),
          ),
          bottomNavigationBar: BottomNavBarCart()),
    );
  }
}
