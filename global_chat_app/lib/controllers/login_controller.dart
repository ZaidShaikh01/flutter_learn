import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/screens/dashboard_screen.dart';
import 'package:global_chat_app/screens/splash_screen.dart';

class LoginController {
  static Future<void> login(
      {required BuildContext context,
      required String password,
      required String email}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Account created successfully!!");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }), (route) {
        return false;
      });
    } catch (e) {
      // Snakbar
      SnackBar messageSnakBar = SnackBar(
          backgroundColor: Colors.red[200], content: Text(e.toString()));

      ScaffoldMessenger.of(context).showSnackBar(messageSnakBar);
      print(e);
    }
  }
}
