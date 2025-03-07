import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/screens/profile_screen.dart';
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
        title: Text("Global Chat"),
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ListTile(
                // The log out button uses firebase.intance.auth to log out
                // We are directly navigating to splash screen
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ProfileScreen();
                    }),
                  );
                },
                leading: Icon(Icons.people),
                title: Text("Profile"),
              ),
              ListTile(
                // The log out button uses firebase.intance.auth to log out
                // We are directly navigating to splash screen
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return SplashScreen();
                  }), (route) {
                    return false;
                  });
                },
                leading: Icon(Icons.logout),
                title: Text("Log out"),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Text("Welcome, "),
          Text((user?.email ?? "").toString()),
        ],
      ),
    );
  }
}
