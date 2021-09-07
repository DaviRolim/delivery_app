// import 'package:classe_a_clone/models/failure.dart';
// import 'package:classe_a_clone/repository/auth_repository.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum NotifierState { initial, loading, loaded }

// class AuthProvider extends ChangeNotifier {
//   final _authRepository = AuthRepository();

//   Either<Failure, bool> _isAuth = Right(false);
//   Either<Failure, bool> get isAuth => _isAuth;

//   NotifierState _state = NotifierState.initial;
//   NotifierState get state => _state;
//   void _setState(NotifierState state) {
//     _state = state;
//     notifyListeners();
//   }

//   void _setAuth(Either<Failure, bool> isAuth) {
//     _isAuth = isAuth;
//     notifyListeners();
//   }

//   void signOut() async {
//     await Task(() => _authRepository.signOut())
//         .attempt()
//         .map(
//           (either) => either.leftMap((obj) {
//             try {
//               return obj as Failure;
//             } catch (e) {
//               throw obj;
//             }
//           }),
//         )
//         .run()
//         .then((value) => _setAuth(value));
//   }

//   Future<Unit> signInWithEmailAndPassword(String email, String password) async {
//     _setState(NotifierState.loading);
//     print('signin');

//     await Task(() => _authRepository.signInWithEmailAndPassword(
//               email,
//               password,
//             ))
//         .attempt()
//         .map(
//           (either) => either.leftMap((obj) {
//             try {
//               return obj as Failure;
//             } catch (e) {
//               throw obj;
//             }
//           }),
//         )
//         .run()
//         .then((value) => _setAuth(value));
//     _setState(NotifierState.loaded);
//     return unit;
//   }

//   Future<Unit> signUpWithEmailAndPassword(
//       String email, String password, String username) async {
//     _setState(NotifierState.loading);

//     await Task(() => _authRepository.signUpWithEmailAndPassword(
//             email, password, username))
//         // Automatically catches exceptions
//         .attempt()
//         // Had to add this map because by default Task resolve to Either<Object, (return of my func)>
//         .map(
//           (either) => either.leftMap((obj) {
//             try {
//               return obj as Failure;
//             } catch (e) {
//               throw obj;
//             }
//           }),
//         )
//         // Converts Task back into a Future
//         .run()
//         // Classic Future continuation
//         .then((value) => _setAuth(value));
//     _setState(NotifierState.loaded);
//     return unit;
//   }

//   static final authNotifier =
//       ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());
// }

// extension TaskX<T extends Either<Object, U>, U> on Task<T> {
//   Task<Either<Failure, U>> mapLeftToFailure() {
//     return this.map(
//       (either) => either.leftMap((obj) {
//         try {
//           return obj as Failure;
//         } catch (e) {
//           throw obj;
//         }
//       }),
//     );
//   }
// }
