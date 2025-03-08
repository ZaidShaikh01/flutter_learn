import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// TO make this variable a global provider it should exted ChangeNotifier
class UserProvider extends ChangeNotifier {
  // Getting the data of current user
  var db = FirebaseFirestore.instance;
  var authUser = FirebaseAuth.instance.currentUser;

  String userName = "";
  String userEmail = "";
  String userId = "";

  // This method will get the data from the firebase
  void getUserDetails() {
    var authUser = FirebaseAuth.instance.currentUser;
    db.collection("users").doc(authUser!.uid).get().then((dataSnapShot) {
      userName = dataSnapShot.data()?["name"] ?? "";
      userEmail = dataSnapShot.data()?["email"] ?? "";
      userId = dataSnapShot.data()?["id"] ?? "";

      notifyListeners();
    });
  }
}
