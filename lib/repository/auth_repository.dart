import 'dart:convert';
import 'dart:async';

import 'package:classe_a_clone/models/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository with ChangeNotifier {
  final bool _isAuth = false;
  bool get isAuth => _isAuth;
  static final authInstance = FirebaseAuth.instance;

  // void signInWithEmailAndPassword() {
  //     try {
  //       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //           email: email.trim(), password: password.trim());
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'user-not-found') {
  //         ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
  //           content: Text('Wrong password provided for that user.'),
  //           backgroundColor: Theme.of(ctx).errorColor,
  //         ));
  //       } else if (e.code == 'wrong-password') {
  //         ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
  //           content: Text('Wrong password provided for that user.'),
  //           backgroundColor: Theme.of(ctx).errorColor,
  //         ));
  //       }
  //     }
  // }

  Future<bool> signUpWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) async {
    var isSignUpCompleted = false;
    try {
      UserCredential userCredential =
          await authInstance.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({'username': username, 'email': email});
      isSignUpCompleted = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        //   content: Text('The password provided is too weak.'),
        //   backgroundColor: Theme.of(ctx).errorColor,
        // ));
        throw Failure('weak password');
      } else if (e.code == 'email-already-in-use') {
        // ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        //   content: Text('The account already exists for that email.'),
        //   backgroundColor: Theme.of(ctx).errorColor,
        // ));
        throw Failure('Email already in use');
      }
    } catch (e) {
      throw Failure('A problem occurred try again later');
    }
    return isSignUpCompleted;
  }
}
