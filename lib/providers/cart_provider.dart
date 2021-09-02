import 'dart:collection';
import 'package:classe_a_clone/models/Cart.dart';
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

  void addItemToCart(CartItem cartItem) {
    if (cartItem.item.isForSale ?? false) {
      cartItem.item.price = cartItem.item.forSalePrice!;
    }
    bool itemInCart =
        _items.indexWhere((element) => element.item.id == cartItem.item.id) >= 0
            ? true
            : false;
    if (itemInCart) {
      updateQuantity(cartItem.item, cartItem.quantity);
    } else {
      _items.add(cartItem);
      notifyListeners();
    }
  }

  void deleteItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(Item item, int quantity) {
    _items[_items.indexWhere((cartItem) => cartItem.item.id == item.id)]
        .quantity = quantity;
    notifyListeners();
  }

  static final cartProvider =
      ChangeNotifierProvider<CartProvider>((ref) => CartProvider());
}
