import 'dart:collection';
import 'package:classe_a_clone/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  double get totalPrice {
    var sum = 0.0;
    _items.forEach((element) => sum += (element.item.price * element.quantity));
    return sum;
  }

  void addItemToCart(CartItem item) {
    _items.add(item);
    print(items.length);
    notifyListeners();
  }

  static final cartProvider =
      ChangeNotifierProvider<CartProvider>((ref) => CartProvider());
}

class CartItem {
  int quantity;
  Item item;

  CartItem(this.quantity, this.item);
}
