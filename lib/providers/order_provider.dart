import 'dart:collection';

import 'package:classe_a_clone/models/Order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderItem> _orderItems = [];
  UnmodifiableListView<OrderItem> get orderItems =>
      UnmodifiableListView(_orderItems);

  void placeOrder(OrderItem order) {
    _orderItems.add(order);
    notifyListeners();
  }

  static final orderProvider =
      ChangeNotifierProvider<OrderProvider>((ref) => OrderProvider());
}
