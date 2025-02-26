import 'package:bucket_list/addBucketList.dart';
import 'package:bucket_list/mainscreen.dart';

import 'package:flutter/material.dart';

// Add DIO Package to make request with API
// GIve permission Seach for internet permisssion android
//
void main() {
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
      //initialRoute: "/home",
      // We dont need to use home argument when we are using the named routing
      home: Mainscreen(),
    );
  }
}
