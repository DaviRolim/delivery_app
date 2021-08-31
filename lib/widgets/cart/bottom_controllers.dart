import 'package:classe_a_clone/models/Item.dart';
import 'package:classe_a_clone/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomControllers extends StatefulWidget {
  final Item selectedItem;
  final int quantity;
  final bool? editMode;
  const BottomControllers(
      {Key? key,
      required this.selectedItem,
      required this.quantity,
      this.editMode})
      : super(key: key);

  @override
  _BottomControllersState createState() => _BottomControllersState();
}

class _BottomControllersState extends State<BottomControllers> {
  var _quantity = 0;
  @override
  void initState() {
    _quantity = widget.quantity;
    super.initState();
  }

  final cartProvider = CartProvider.cartProvider;
  @override
  Widget build(BuildContext context) {
    final item = widget.selectedItem;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _quantity--;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: Colors.grey[400],
            ),
          ),
          Text(
            _quantity.toString(),
            style: TextStyle(
                color: Colors.grey[300],
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _quantity++;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 45,
              child: Consumer(builder: (context, ref, ch) {
                return ElevatedButton(
                  onPressed: () {
                    if (_quantity > 0) {
                      if (widget.editMode == true) {
                        ref
                            .read(cartProvider)
                            .updateQuantity(widget.selectedItem, _quantity);
                        Navigator.of(context).pop();
                      } else {
                        ref.read(cartProvider).addItemToCart(
                            CartItem(_quantity, widget.selectedItem));
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'ADICIONAR R\$${item.isForSale ?? false ? (item.forSalePrice! * _quantity) : (item.price * _quantity)}',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
