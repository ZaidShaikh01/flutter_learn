import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/screens/dashboard_screen.dart';
import 'package:global_chat_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // Check for login states

    Future.delayed(Duration(seconds: 2), () {
      if (user == null) {
        openLoginPage();
      } else {
        openDashBoard();
      }
    });
    super.initState();
  }

  void openDashBoard() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return DashboardScreen();
    }));
  }

  void openLoginPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/images/logo.png")),
      ),
    );
  }
}
