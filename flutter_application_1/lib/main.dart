import 'package:flutter/material.dart';
import 'package:flutter_application_1/child/child_one.dart';
import 'package:flutter_application_1/child/child_three.dart';
import 'package:flutter_application_1/child/child_two.dart';

void main() {
  runApp(MyApp());
}

// CUstom Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          title: Text(
            "Hello Flutter",
            style: TextStyle(fontFamily: "Poppins"),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          // Only at top
          //paddint : EdgeInsets.only(top:20,left:20)
          // Internal spacing-padding
          // External spacing - Margin It also needs same arguments

          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChildOne(),
              ChildTwo(),
              ChildThree(),
            ],
          ),
        ),
      ),
    );
  }
}
