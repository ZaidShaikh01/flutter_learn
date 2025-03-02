import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Viewitem extends StatefulWidget {
  // This field are here used to share the data between different pages
  String title;
  String image;
  int index;
  String details;
  Viewitem(
      {super.key,
      required this.title,
      required this.image,
      required this.index,
      required this.details});

  @override
  State<Viewitem> createState() => _ViewitemState();
}

class _ViewitemState extends State<Viewitem> {
  Future<void> deleteData() async {
    // Here we are using DIO.delete and we are also deleting the value at that index
    // So, Try catch is also used.
    // We are also navigating back.
    Navigator.pop(context);
    try {
      Response response = await Dio().delete(
          "https://bucketlist-8a6cd-default-rtdb.firebaseio.com/bucketlist/${widget.index}.json");

      Navigator.pop(context);
    } catch (e) {
      print("Error");
    }
  }

  Future<void> markAsComplete() async {
    try {
      // Show loading indicator if needed
      Map<String, dynamic> data = {"completed": true};

      Response response = await Dio().patch(
        "https://bucketlist-8a6cd-default-rtdb.firebaseio.com/bucketlist/${widget.index}.json",
        data: data,
      );

      if (response.statusCode == 200) {
        Navigator.pop(context); // Only pop after a successful response
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
        actions: [
          // For creating the Pop menu button list
          PopupMenuButton(
              // has an atribute that takes value as attribute
              // We have to set value of pop menu Item
              onSelected: (value) {
            if (value == 1) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Are you sure to delete?"),
                      actions: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context, "referesh");
                            },
                            child: Text("Cancel")),
                        InkWell(onTap: deleteData, child: Text("Confirm")),
                      ],
                    );
                  });
            }
            if (value == 3) {
              markAsComplete();
            }
          }, itemBuilder: (context) {
            // It takes pop menu item list
            return [
              //
              PopupMenuItem(value: 1, child: Text("Delete")),
              PopupMenuItem(value: 3, child: Text("Mark as complete")),
            ];
          })
        ],
        title: Text("${widget.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              // Either do it like this
              //child: Image(image: NetworkImage("${widget.image}")),
              // or use decoration
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.image))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 470,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[100],
              ),
              child: Text(widget.details),
            )
          ],
        ),
      ),
    );
  }
}
