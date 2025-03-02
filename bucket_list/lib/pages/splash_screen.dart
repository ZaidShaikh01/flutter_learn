import 'package:bucket_list/pages/login_page.dart';
import 'package:bucket_list/pages/mainscreen.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Check the login status of user here
    // Depending on that change the screen page

    Future.delayed(Duration(seconds: 4), () {
      openLogin();
    });

    super.initState();
  }

  void openDashBoard() {
    // Replaces the current screen with the new screen hence wont allowing it to splash screen

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Mainscreen();
    }));
  }

  void openLogin() {
    // Replaces the current screen with the new screen hence wont allowing it to splash screen
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.amber,
      body: Center(child: Text("Solapur Tourism")),
    );
  }
}
