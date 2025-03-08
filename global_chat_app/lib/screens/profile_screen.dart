import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/providers/userProvider.dart';
import 'package:global_chat_app/screens/editprofile_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // We are getting map data

  Map<String, dynamic>? userData = {};

  @override
  Widget build(BuildContext context) {
    // We are bringing the UserProvide provider in this screen

    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(""),
      ),
      body: Container(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CircleAvatar(
            radius: 50,
            child: Text(userProvider.userName[0]),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            userProvider.userName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(userProvider.userEmail),

          // Allowing user to change the name

          ElevatedButton(
            onPressed: () {
              // Opening the edit profile screen

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditProfileScreen();
              }));
            },
            child: Text("Edit Profile"),
          )
        ]),
      ),
    );
  }
}
