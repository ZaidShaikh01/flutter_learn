import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:funfact_app/screens/settings_screens.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<dynamic> facts = [];

  // To add a lodingn animation
  bool isLoading = true;

  // Getting the reponse from the API that we have created
  Future<void> getData() async {
    try {
      Response response = await Dio().get(
          "https://raw.githubusercontent.com/ZaidShaikh01/flutter_dummy_api/refs/heads/main/facts.json");

      // The response data is of String type so we first need to convert into the json formate
      facts = jsonDecode(response.data);
      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = false;
      
    }
  }

  // Getting the data during init state
  @override
  void initState() {
    getData();

    super.initState();
  }

  // Api URL
  // https://raw.githubusercontent.com/ZaidShaikh01/flutter_dummy_api/refs/heads/main/facts.json
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Fun Facts"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingsScreens();
                  }));
                },
                child: Icon(Icons.settings)),
          )
        ],
      ),

      // Using Page view Builder to bulid the pages. ..Like you can slide and view the items
      // Can also be use for TikTok like app
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: facts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            child: Text(
                          facts[index],
                          style: TextStyle(fontSize: 50),
                          textAlign: TextAlign.center,
                        )),
                      ));
                    }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text("Swipe left for more..."),
            ),
          )
        ],
      ),
    );
  }
}
