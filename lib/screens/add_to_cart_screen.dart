import 'package:classe_a_clone/models/Item.dart';
import 'package:classe_a_clone/widgets/cart/bottom_controllers.dart';
import 'package:classe_a_clone/widgets/cart/hero_container.dart';
import 'package:flutter/material.dart';

class AddToCartScreen extends StatelessWidget {
  final Item selectedItem;
  final int quantity;
  final bool? editMode;
  AddToCartScreen(this.selectedItem, this.quantity, {this.editMode, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Column(
            children: [
              HeroContainer(
                itemId: selectedItem.id,
                imageUrl: selectedItem.imageUrl!,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedItem.name,
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      selectedItem.description,
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
        bottomNavigationBar: BottomControllers(
          selectedItem: selectedItem,
          quantity: quantity,
          editMode: editMode ?? false,
        ));
  }
}
