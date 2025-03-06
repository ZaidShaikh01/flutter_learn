import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/screens/dashboard_screen.dart';

class SignupController {
  static Future<void> createAccount(
      {required BuildContext context,
      required String password,
      required String email}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Account created successfully!!");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return DashboardScreen();
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
