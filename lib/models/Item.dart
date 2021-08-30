class Item {
  String id;
  String name;
  String description;
  double price;
  String section;
  String? imageUrl;
  bool? isForSale;
  double? forSalePrice;
  bool? mostOrdered;
  bool? weekForSale;
  bool? recommended;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.section,
    this.imageUrl,
    this.isForSale,
    this.forSalePrice,
    this.mostOrdered,
    this.weekForSale,
    this.recommended,
  });
}
