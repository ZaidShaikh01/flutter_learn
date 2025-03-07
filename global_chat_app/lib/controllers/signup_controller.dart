import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/screens/dashboard_screen.dart';

class SignupController {
  static Future<void> createAccount(
      {required BuildContext context,
      required String password,
      required String name,
      required String country,
      required String email}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // This will give teh unique ID that is created by firebase auth
      var userId = FirebaseAuth.instance.currentUser!.uid;

      var db = FirebaseFirestore.instance;

      // This is the data that we are going to pass in the cloud storage
      Map<String, dynamic> data = {
        "name": name,
        "country": country,
        "email": email,
        "id": userId.toString()
      };

      // Saving the data in the users table & it might throw error, So, Wrap it with try catch

      try {
        await db.collection("users").doc(userId.toString()).set(data);
      } catch (e) {
        print(e);
      }
      print("Account created successfully!!");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return DashboardScreen();
      }), (route) {
        return false;
      });
      // Here return false means all the pages in the stack will be removed
    } catch (e) {
      // Snakbar
      SnackBar messageSnakBar = SnackBar(
          backgroundColor: Colors.red[200], content: Text(e.toString()));

      ScaffoldMessenger.of(context).showSnackBar(messageSnakBar);
      print(e);
    }
  }
}
