import 'package:badges/badges.dart';
import 'package:classe_a_clone/helpers/hide_navbar.dart';
import 'package:classe_a_clone/models/failure.dart';
import 'package:classe_a_clone/providers/auth_provider.dart';
import 'package:classe_a_clone/providers/auth_provider_reference.dart';
import 'package:classe_a_clone/providers/cart_provider.dart';
import 'package:classe_a_clone/screens/auth_screen.dart';
import 'package:classe_a_clone/screens/cart_screen.dart';
import 'package:classe_a_clone/screens/for_sale_screen.dart';
import 'package:classe_a_clone/screens/menu_screen.dart';
import 'package:classe_a_clone/screens/orders_screen.dart';
import 'package:classe_a_clone/screens/profile_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = 'main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  List<Map<String, dynamic>> _pages = [];
  int _selectedPageIndex = 0;
  final HideNavbar hiding = HideNavbar();
  bool isAuth = false;

  @override
  void initState() {
    _pages = [
      {
        'page': MenuScreen(
          controller: hiding.controller,
        ),
      },
      {
        'page': OrdersScreen(),
        'appBarTitle': Text(
          'Pedidos',
          style: TextStyle(color: Colors.white),
        ),
      },
      {
        'page': isAuth ? ProfileScreen() : AuthScreen(),
        'appBarTitle': Text(
          isAuth ? 'Perfil' : 'Entrar',
          style: TextStyle(color: Colors.white),
        ),
      },
      {
        'page': ForSale(),
        'title': 'algo pra colocar no appBar',
      },
      {
        'page': CartScreen(),
      },
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final cartProvider = CartProvider.cartProvider;
  final authProvider = AuthProvider.authNotifier;

  @override
  Widget build(BuildContext context) {
    ref.read(authProvider).tryAutoLogin();
    isAuth = ref.watch(authProvider).isAuth;
    // Either<Failure, bool> result = ref.watch(authProvider).isAuth;
    // result.fold((failure) => print('failure main'),
    //     (userAuthenticated) => isAuth = userAuthenticated);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: _pages[_selectedPageIndex]['appBarTitle'] != null
          ? AppBar(
              backgroundColor: Colors.black,
              title: _pages[_selectedPageIndex]['appBarTitle'],
              centerTitle: false,
              actions: [
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () => ref.read(authProvider).signOut(),
                  ),
                ])
          : null,
      body: Container(child: _pages[_selectedPageIndex]['page']),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: hiding.visible,
        builder: (context, bool value, child) => AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: value ? kBottomNavigationBarHeight : 0.0,
          child: Wrap(
            children: [
              BottomNavigationBar(
                onTap: _selectPage,
                elevation: 4,
                unselectedItemColor: Colors.grey[600],
                selectedItemColor: Colors.grey[200],
                currentIndex: _selectedPageIndex,
                backgroundColor: Colors.grey[900],
                // showSelectedLabels: false,
                showUnselectedLabels: true,
                // type: BottomNavigationBarType.shifting,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Card??pio'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list_alt), label: 'Pedidos'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: isAuth ? 'Perfil' : 'Entrar'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sell), label: 'Promo????es'),
                  BottomNavigationBarItem(
                      icon: ref.watch(cartProvider).items.length > 0
                          ? Badge(
                              // position: BadgePosition.topEnd(top: 10, end: 10),
                              badgeContent: Text(
                                ref.watch(cartProvider).items.length.toString(),
                                // ref.watch(cartProvider).items.length.toString(),
                                style: TextStyle(color: Colors.grey[200]),
                              ),
                              child: Icon(Icons.shopping_cart),
                            )
                          : Icon(Icons.shopping_cart),
                      label: 'Carrinho'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
