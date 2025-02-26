import 'dart:math';

import 'package:flutter/material.dart';
import 'package:millionaire_app/add_money_button.dart';
import 'package:millionaire_app/bank_balance.dart';
import 'package:millionaire_app/contain.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void addMoney() async {
    setState(() {
      balance += 500;
    });
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setDouble('balance', balance);
  }

  @override
  void initState() {
    // TODO: implement initState
    loadBalance();
  }

  void loadBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // If any user is opening the app for first time then the balance will be null
    // SO this is a fall back value which can be given by ?? thing

    setState(() {
      balance = prefs.getDouble('balance') ?? 0;
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
          body: Contain(addMoney: addMoney, balance: balance)),
    );
  }
}
