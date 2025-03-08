import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/providers/userProvider.dart';
import 'package:provider/provider.dart';

class ChatroomPage extends StatefulWidget {
  // We want chatroom name and chatroom Id so that we can query the database
  String chatroomName;
  String chatroomId;

  ChatroomPage(
      {super.key, required this.chatroomName, required this.chatroomId});

  @override
  State<ChatroomPage> createState() => _ChatroomPageState();
}

class _ChatroomPageState extends State<ChatroomPage> {
  // Creating the instance of the database

  var db = FirebaseFirestore.instance;

  // Text editing controller to send the text
  TextEditingController sendText = TextEditingController();
  // Writing a code to send the message
  Future<void> sendMessage() async {
    if (sendText.text.isEmpty) {
      return;
    }
    // Constructing a map data to send the data into the database

    Map<String, dynamic> messageToSend = {
      "text": sendText.text,
      "sender_name": Provider.of<UserProvider>(context, listen: false).userName,
      "chatroom_id": widget.chatroomId,
      // This is the time of the server
      "timestamp": FieldValue.serverTimestamp(),
    };

    try {
      await db.collection("messages").add(messageToSend);
    } catch (e) {
      print(e);
    }

    // Clearing the text field once message has been sent
    sendText.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.chatroomName),
        ),
        body: Column(
          children: [
            Expanded(

                // This widget will display the messages in realtime like it fetches in real time
                child: StreamBuilder(

                    // This is the source of the stream we are ordering it by the timestamp
                    stream: db
                        .collection("messages")
                        .orderBy("timestamp", descending: true)
                        .snapshots(),

                    // This is the builder of the stream
                    builder: (context, snapshot) {
                      // SnapShot stores all the realtime data

                      var allMessages = snapshot.data?.docs ?? [];
                      return ListView.builder(
                        // This starts building from bottom
                        reverse: true,
                        itemCount: allMessages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${allMessages[index]['sender_name']}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("${allMessages[index]['text']}"),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    })),
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: sendText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type a message..",
                      ),
                    )),
                    InkWell(onTap: sendMessage, child: Icon(Icons.send)),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
