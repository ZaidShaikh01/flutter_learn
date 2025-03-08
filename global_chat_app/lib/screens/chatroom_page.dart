import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.chatroomName),
      ),
      body: 
    );
  }
}
