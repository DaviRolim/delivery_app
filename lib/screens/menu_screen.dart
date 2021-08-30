import 'package:classe_a_clone/data/items.dart';
import 'package:classe_a_clone/models/Item.dart';
import 'package:classe_a_clone/providers/cart_provider.dart';
import 'package:classe_a_clone/screens/add_to_cart_screen.dart';
import 'package:classe_a_clone/widgets/menu/custom_divider.dart';
import 'package:classe_a_clone/widgets/menu/header_section.dart';
import 'package:classe_a_clone/widgets/menu/line_item.dart';
import 'package:classe_a_clone/widgets/menu/section_divider.dart';
import 'package:classe_a_clone/widgets/menu/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuScreen extends ConsumerWidget {
  final ScrollController? controller;
  MenuScreen({this.controller});
  static const routeName = 'menu';
  final sushiImage = 'https://exame.com/wp-content/uploads/2017/05/sushi.jpg';

  // final cartProvider =
  //     ChangeNotifierProvider<CartProvider>((ref) => CartProvider());

  final cartProvider = CartProvider.cartProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: CustomScrollView(
          controller: controller != null ? controller : null,
          slivers: [
            SliverAppBar(
              expandedHeight: 180,
              backgroundColor: Colors.transparent,
              centerTitle: false,
              forceElevated: true,
              // pinned: true,
              flexibleSpace: Container(
                child: FlexibleSpaceBar(
                  // title: Text(
                  //   '!',
                  //   textAlign: TextAlign.left,
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  background: 1 == 2
                      ? Placeholder()
                      : Image.network(sushiImage, fit: BoxFit.cover),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      HeaderSection(),
                      SectionDivider(),
                      SectionTitle(sectionTitle: 'Destaques'),
                      ...MockedItems.destaques
                          .map(
                            (item) => Column(
                              children: [
                                InkWell(
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
                                    child: LineItem(
                                      title: item.name,
                                      subtitle: item.description,
                                      price: item.price > 0
                                          ? '${item.price}'
                                          : '--',
                                      imagePath: item.imageUrl!,
                                      isDestaque: true,
                                      recommended: item.recommended,
                                      mostOrdered: item.mostOrdered,
                                      weekForSale: item.weekForSale,
                                      promoPrice: item.forSalePrice != null
                                          ? '${item.forSalePrice}'
                                          : null,
                                    ),
                                  ),
                                ),
                                CustomDivider()
                              ],
                            ),
                          )
                          .toList(),
                      SectionDivider(),
                      SectionTitle(sectionTitle: 'Sushi Burger'),
                      CustomDivider(),
                      ...MockedItems.sushiBurgers.map(
                        (item) => Column(
                          children: [
                            InkWell(
                              // onTap: () =>  ref.read(cartProvider).addItemToCart(item),
                              child: LineItem(
                                title: item.name,
                                subtitle: item.description,
                                price: item.price > 0 ? '${item.price}' : '--',
                                imagePath: item.imageUrl!,
                                promoPrice: item.forSalePrice != null
                                    ? '${item.forSalePrice}'
                                    : null,
                              ),
                            ),
                            CustomDivider()
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
