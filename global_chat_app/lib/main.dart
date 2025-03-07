import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:global_chat_app/providers/userProvider.dart';
import 'package:global_chat_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    // This special widget helps to notify and create the global variable, Just like set state
    
    child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
