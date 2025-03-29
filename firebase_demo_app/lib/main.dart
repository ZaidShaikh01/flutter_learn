import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo_app/firebase_options.dart';
import 'package:firebase_demo_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // THis is to initialize the flutter engine
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}