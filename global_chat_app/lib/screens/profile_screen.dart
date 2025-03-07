import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Getting the data of current user
  var db = FirebaseFirestore.instance;
  var authUser = FirebaseAuth.instance.currentUser;
  // We are getting map data

  Map<String, dynamic>? userData = {};

  // This method will get the data from the firebase
  void getData() {
    db.collection("users").doc(authUser!.uid).get().then((dataSnapShot) {
      userData = dataSnapShot.data();
      setState(() {});
    });
  }

  // This method will get use the data when the widget is created
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Column(children: [
        Text(userData?["name"] ?? ""),
        Text(userData?["country"] ?? ""),
        Text(userData?["email"] ?? ""),
      ]),
    );
  }
}
