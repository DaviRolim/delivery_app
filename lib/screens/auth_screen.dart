import 'package:classe_a_clone/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerStatefulWidget {
  AuthScreen({Key? key}) : super(key: key);
  static const routeName = 'authscreen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 60,
          bottom: const TabBar(
            tabs: [
              // Tab(icon: Icon(Icons.directions_transit)),
              // Tab(icon: Icon(Icons.directions_bike)),
              Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: Text(
                  'CADASTRAR',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 14.0),
                child: Text(
                  'JÁ TENHO CONTA',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AuthForm(isLogin: false),
            AuthForm(isLogin: true),
          ],
        ),
      ),
    );
  }
}
