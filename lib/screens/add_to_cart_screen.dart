import 'package:classe_a_clone/models/Item.dart';
import 'package:classe_a_clone/providers/cart_provider.dart';
import 'package:classe_a_clone/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToCartScreen extends StatefulWidget {
  final Item selectedItem;
  final int quantity;
  final bool? editMode;
  AddToCartScreen(this.selectedItem, this.quantity, {this.editMode, Key? key})
      : super(key: key);

  @override
  _AddToCartScreenState createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  var _quantity = 0;
  @override
  void initState() {
    _quantity = widget.quantity;
    super.initState();
  }

  // var _totalPrice = 0.0;
  final cartProvider = CartProvider.cartProvider;
  @override
  Widget build(BuildContext context) {
    final item = widget.selectedItem;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Hero(
                tag: widget.selectedItem.id,
                child: widget.selectedItem.imageUrl!.contains('assets')
                    ? Image.asset(
                        widget.selectedItem.imageUrl!,
                        fit: BoxFit.fill,
                      )
                    : Image.network(widget.selectedItem.imageUrl!,
                        fit: BoxFit.fill),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.selectedItem.name,
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.selectedItem.description,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 25),
                  Divider(
                    color: Colors.grey[800],
                  ),
                  SizedBox(height: 45),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: TextStyle(color: Colors.grey[300]),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey[400]!, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          labelText: 'Observações',
                          labelStyle: TextStyle(color: Colors.grey[400]!),
                          counterStyle: TextStyle(color: Colors.grey[500])),
                      maxLength: 256,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
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
      ),
    );
  }
}
