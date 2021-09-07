import 'package:classe_a_clone/models/failure.dart';
import 'package:classe_a_clone/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NotifierState { initial, loading, loaded }

class AuthProvider extends ChangeNotifier {
  final _authRepository = AuthRepository();

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  void _setAuth(bool isAuth) {
    _isAuth = isAuth;
    notifyListeners();
  }

  void signOut() async {
    try {
      _authRepository.signOut();
      _setAuth(false);
      notifyListeners();
    } on Failure catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<Unit> signInWithEmailAndPassword(String email, String password) async {
    _setState(NotifierState.loading);
    print(email + password);
    try {
      await _authRepository.signInWithEmailAndPassword(
        email,
        password,
      );
      _setAuth(true);
    } on Failure catch (e) {
      print(e.toString());
      throw e;
    }

    _setState(NotifierState.loaded);
    return unit;
  }

  Future<Unit> signUpWithEmailAndPassword(
      String email, String password, String username) async {
    _setState(NotifierState.loading);
    try {
      await _authRepository.signUpWithEmailAndPassword(
          email, password, username);
      _setAuth(true);
    } on Failure catch (e) {
      print(e.toString());
      throw e;
    }

    _setState(NotifierState.loaded);
    return unit;
  }

  void tryAutoLogin() {
    _authRepository.tryAutoLogin();
    _setAuth(true);
  }

  static final authNotifier =
      ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());
}
