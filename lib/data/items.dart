import 'package:classe_a_clone/models/Item.dart';

class MockedItems {
  static List<Item> items = [
    Item(
      id: '1',
      name: 'Molho Shoyu',
      description: 'Deseja molho shoyu?',
      price: 0.0,
      imageUrl: 'assets/images/image png.png',
      section: 'destaque',
      mostOrdered: true,
    ),
    Item(
      id: '2',
      name: 'Temaki camarão',
      description: ' (Arroz, cebolinha, cream cheese e camarão)',
      price: 23.99,
      isForSale: true,
      forSalePrice: 20.99,
      imageUrl:
          'https://www.ciadomarbh.com.br/media/k2/items/cache/077ab55046ce80eaf9a3ddea999597ca_XL.jpg',
      section: 'destaque',
      weekForSale: true,
    ),
    Item(
      id: '3',
      name: 'Molho Tarê',
      description: 'Deseja molho tarê?',
      price: 0.0,
      imageUrl:
          'https://s3.amazonaws.com/static.vmarket.com.br/img/110/molho_tare_sache_120x18gr_saku_1814ab50_grande.png',
      section: 'destaque',
      recommended: true,
    ),
    Item(
      id: '4',
      name: 'Sushi Burger Salmão e Camarão',
      description:
          'Arroz frito na panko, camarão, salmão, alface crespa, cebola roxa e gergelim.',
      price: 29.99,
      imageUrl:
          'https://senhormiyagi.pedzap.com.br/uploads/itens/162342_foto_mini.jpeg',
      section: 'Sushi Burger',
    ),
  ];
  static List<Item> destaques = [
    Item(
      id: '1',
      name: 'Molho Shoyu',
      description: 'Deseja molho shoyu?',
      price: 0.0,
      imageUrl: 'assets/images/image png.png',
      section: 'destaque',
      mostOrdered: true,
    ),
    Item(
      id: '2',
      name: 'Temaki camarão',
      description: ' (Arroz, cebolinha, cream cheese e camarão)',
      price: 23.99,
      isForSale: true,
      forSalePrice: 20.99,
      imageUrl:
          'https://www.ciadomarbh.com.br/media/k2/items/cache/077ab55046ce80eaf9a3ddea999597ca_XL.jpg',
      section: 'destaque',
      weekForSale: true,
    ),
    Item(
      id: '3',
      name: 'Molho Tarê',
      description: 'Deseja molho tarê?',
      price: 0.0,
      imageUrl:
          'https://s3.amazonaws.com/static.vmarket.com.br/img/110/molho_tare_sache_120x18gr_saku_1814ab50_grande.png',
      section: 'destaque',
      recommended: true,
    ),
  ];
  static List<Item> sushiBurgers = [
    Item(
      id: '4',
      name: 'Sushi Burger Salmão e Camarão',
      description:
          'Arroz frito na panko, camarão, salmão, alface crespa, cebola roxa e gergelim.',
      price: 29.99,
      imageUrl:
          'https://senhormiyagi.pedzap.com.br/uploads/itens/162342_foto_mini.jpeg',
      section: 'Sushi Burger',
    ),
  ];
}
