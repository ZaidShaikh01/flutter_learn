import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/screens/splash_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DashBoard"),
      ),
      body: Column(
        children: [
          Text("Welcome, "),
          Text((user?.email ?? "").toString()),
          ElevatedButton(
              onPressed: () async {
                // This will sign out the user
                await FirebaseAuth.instance.signOut();

                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return SplashScreen();
                }), (route) {
                  return false;
                });
              },
              child: Text("Log out"))
        ],
      ),
    );
  }
}
