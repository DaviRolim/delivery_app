import 'package:classe_a_clone/models/Cart.dart';

enum OrderStatus { PREPARING, DISPATCHED, ARRIVED }

class OrderItem {
  final String id;
  final double total;
  final List<CartItem> items;
  final DateTime dateTime;
  final OrderStatus status;

  OrderItem({
    required this.status,
    required this.id,
    required this.total,
    required this.items,
    required this.dateTime,
  });
}
