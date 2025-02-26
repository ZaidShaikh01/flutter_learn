import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddbucketlistScreen extends StatefulWidget {
  int newIndex;
  AddbucketlistScreen({super.key, required this.newIndex});

  @override
  State<AddbucketlistScreen> createState() => _AddbucketlistScreenState();
}

class _AddbucketlistScreenState extends State<AddbucketlistScreen> {
  Future<void> addData() async {
    try {
      // Show loading indicator if needed
      Map<String, dynamic> data = {
        "item": "Visit nepal",
        "cost": 10000,
        "image":
            "https://th.bing.com/th/id/OIP._UNasqmNY5xyWu98GiyupAHaFM?rs=1&pid=ImgDetMain",
        "completed": false
      };

      Response response = await Dio().patch(
        "https://bucketlist-8a6cd-default-rtdb.firebaseio.com/bucketlist/${widget.newIndex}.json",
        data: data,
      );

      if (response.statusCode == 200) {
        Navigator.pop(
            context, "referesh"); // Only pop after a successful response
      } else {
        print("Failed to mark as complete: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to mark as complete")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Bucket List"),
      ),
      body: ElevatedButton(onPressed: addData, child: Text("ADD DUMMY DATA")),
    );
  }
}
