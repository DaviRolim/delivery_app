import 'package:classe_a_clone/screens/auth_screen.dart';
import 'package:classe_a_clone/screens/cart_screen.dart';
import 'package:classe_a_clone/screens/for_sale_screen.dart';
import 'package:classe_a_clone/screens/main_screen.dart';
import 'package:classe_a_clone/screens/menu_screen.dart';
import 'package:classe_a_clone/screens/orders_screen.dart';
import 'package:classe_a_clone/screens/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey, cardColor: Colors.grey[900]),
      home: MainScreen(),
      routes: {
        MenuScreen.routeName: (ctx) => MenuScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        OrdersScreen.routeName: (ctx) => ProfileScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        ForSale.routeName: (ctx) => ForSale(),
        AuthScreen.routeName: (ctx) => AuthScreen(),
        MainScreen.routeName: (ctx) => MainScreen(),
      },
    );
  }
}
