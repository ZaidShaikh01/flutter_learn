import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0;
  void addMoney() {
    setState(() {
      balance += 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Billionaire App"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.blueGrey[700],
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // This one is to demonstrate how Expanded and flex works

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: Container(
              //         color: Colors.amber,
              //         child: Text("0"),
              //       ),
              //     ),
              //     Expanded(
              //       // TO make this one more bigger
              //       flex: 2,
              //       child: Container(
              //         color: Colors.red,
              //         child: Text("1"),
              //       ),
              //     ),
              //     Expanded(
              //       flex: 1,
              //       child: Container(
              //         color: Colors.black,
              //         child: Text("2"),
              //       ),
              //     )
              //   ],
              // ),

              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bank Balance: "),
                    SizedBox(
                      height: 20,
                    ),
                    Text("$balance"),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        minimumSize: Size(double.infinity, 0),
                      ),
                      onPressed: addMoney,
                      child: Text("Add Money")))
            ],
          ),
        ),
      ),
    );
  }
}
