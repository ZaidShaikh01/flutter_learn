import 'package:bucket_list/pages/addBucketList.dart';
import 'package:bucket_list/firebase_options.dart';
import 'package:bucket_list/pages/mainscreen.dart';
import 'package:bucket_list/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

// Add DIO Package to make request with API
// Give permission Seach for internet permisssion android
//
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
      // This is named routing used to navigate between different pages in the app
      // Common practice to use backslash while using route
      // routes: {
      //   "/home": (context) {
      //     return Mainscreen();
      //   },
      //   "/add": (context) {
      //     return AddbucketlistScreen();
      //   }
      // },
      
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      //initialRoute: "/home",
      // We dont need to use home argument when we are using the named routing
      home: SplashScreen(),
    );
  }
}
