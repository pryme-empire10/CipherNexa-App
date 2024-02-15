// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../screen/home_screen.dart';

// class HandleAuthentication {
//   final _auth = FirebaseAuth.instance;

//   final _formKey = GlobalKey<FormState>();
//   final _fKey = GlobalKey<FormState>();

//   GlobalKey<FormState> get formKey => _formKey;
//   GlobalKey<FormState> get fkey => _fKey;

//   //User SignIn
// //  Future userSignIn(String email, String password, BuildContext context) async {
// //     if (_formKey.currentState!.validate()) {
// //       try {
// //         await _auth
// //             .signInWithEmailAndPassword(
// //           email: email,
// //           password: password,
// //         )
// //             .then((value) {
// //           Navigator.of(context).push(MaterialPageRoute(
// //             builder: (context) => const HomeScreen(),
// //           ));
// //         });
// //       } on FirebaseAuthException catch (e) {
// //         String errorMessage;
// //         switch (e.code) {
// //           case 'Invalid Email':
// //             errorMessage = 'your email is invalid';
// //             break;
// //           case 'Wrong Password':
// //             errorMessage = 'wrong password provided for the given email';
// //             break;
// //           case 'User-not-found':
// //             errorMessage = 'user with this email does not exist';
// //             break;
// //           case 'User - disabled':
// //             errorMessage =
// //                 'the current user has been disabled and can\'t sign in.';
// //             break;
// //           case 'too - many - request':
// //             errorMessage =
// //                 "you've tried to login too much. Please wait a moment.";
// //             break;
// //           default:
// //             errorMessage = 'An undefined error happened';
// //         }
// //         if (context.mounted) {
// //           final snackBar = SnackBar(content: Text(errorMessage));
// //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
// //         }
// //         // ignore: avoid_print
// //         print(e.code);
// //       }
// //     }
// //   }

//   //User SignUp
//   Future<void> userSignUp(
//       BuildContext context, String email, String password) async {
//     if (_fKey.currentState!.validate()) {
//       try {
//         await _auth
//             .createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         )
//             .then((value) {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Registration Successful',
//                       style: TextStyle(fontSize: 13),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(
//                         Icons.cancel_outlined,
//                       ),
//                     )
//                   ],
//                 ),
//                 actions: const [
//                   Text('Please Sign In your email and password.')
//                 ],
//               );
//             },
//           );
//         });
//       } on FirebaseAuthException catch (error) {
//         String message;
//         switch (error.code) {
//           case 'email-already-in-use':
//             message = 'The email address is already in use by another user.';
//             break;
//           case 'Invalid-email':
//             message = 'Your email appears to be malformed';
//             break;
//           case 'Wrong-password':
//             message = 'User-not-found';
//             break;
//           case 'User-disabled':
//             message = 'User with this email has been disabled';
//             break;
//           case 'User-not-found':
//             message = 'User with this email doesn\'t exist';
//             break;
//           case 'Too-many-request':
//             message = 'Too many request';
//             break;
//           default:
//             message = 'An undefined error happened';
//         }

//         if (context.mounted) {
//           final snackBar = SnackBar(
//             content: Text(message),
//           );
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }
//       }
//     }
//   }
// }
