import 'Item.dart';

class Cart {
  List<Item>? items = [];

  void addItem(Item item) {
    print(item.name);
    items!.add(item);
  }

  get total {
    var sum = 0.0;
    items!.forEach((element) => sum += element.price);
    return sum;
  }
}
