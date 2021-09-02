import 'package:classe_a_clone/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'orders';
  final orderProvider = OrderProvider.orderProvider;
  final Color titleColor = Colors.blueGrey[200]!;
  final Color subTitleColor = Colors.grey[200]!;
  final Color priceColor = Colors.grey[300]!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //order.orderItems[index].dateTime
      child: Consumer(builder: (context, ref, child) {
        final order = ref.watch(orderProvider);
        return Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: ListView.builder(
                itemCount: order.orderItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('E, d MMM y') // hh:mm
                            .format(order.orderItems[index].dateTime),
                        style: TextStyle(
                            color: titleColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 90,
                        child: Card(
                          elevation: 4,
                          color: Colors.black38,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'PEDIDO # ${order.orderItems[index].id}',
                                        style: TextStyle(color: titleColor),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.verified,
                                            color: subTitleColor,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text('DELIVERED',
                                              style: TextStyle(
                                                  color: subTitleColor,
                                                  fontSize: 14))
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                          'R\$${order.orderItems[index].total.toStringAsFixed(2)}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(color: priceColor)),
                                    ]),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'DELIVERY',
                                      style: TextStyle(
                                        color: titleColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: 5),
                                        Text('VIEW DETAILS ',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14)),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: subTitleColor,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }));
      }),
    );
  }
}
