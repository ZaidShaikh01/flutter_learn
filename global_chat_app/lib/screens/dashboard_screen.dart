import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/providers/userProvider.dart';
import 'package:global_chat_app/screens/chatroom_page.dart';
import 'package:global_chat_app/screens/profile_screen.dart';
import 'package:global_chat_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance;

  // We need a key to access the drawer through circular icon

  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> chatRoomsList = [];
  List<String> chatRoomsIds = [];

  void getChatRooms() {
    // Here we are getting the data in the form of list henve list is used
    db.collection("chatrooms").get().then((dataSnapShot) {
      // This method will run for the amount of data that we have in dataSnapShot
      for (var singleChatRoomData in dataSnapShot.docs) {
        // This will provide the data of that database class
        chatRoomsList.add(singleChatRoomData.data());
        // This will provide the ID of that database
        chatRoomsIds.add(singleChatRoomData.id.toString());
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getChatRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Getting the provider
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Global Chat"),
          leading: InkWell(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                radius: 20,
                child: Text(userProvider.userName[0]),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  // The log out button uses firebase.intance.auth to log out
                  // We are directly navigating to splash screen
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ProfileScreen();
                      }),
                    );
                  },
                  leading: CircleAvatar(
                    child: Text(userProvider.userName[0]),
                  ),
                  title: Text(
                    userProvider.userName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(userProvider.userEmail),
                ),
                ListTile(
                  // The log out button uses firebase.intance.auth to log out
                  // We are directly navigating to splash screen
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ProfileScreen();
                      }),
                    );
                  },
                  leading: Icon(Icons.people),
                  title: Text("Profile"),
                ),
                ListTile(
                  // The log out button uses firebase.intance.auth to log out
                  // We are directly navigating to splash screen
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return SplashScreen();
                    }), (route) {
                      return false;
                    });
                  },
                  leading: Icon(Icons.logout),
                  title: Text("Log out"),
                )
              ],
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: chatRoomsList.length,
            itemBuilder: (BuildContext context, int index) {
              String chatroomName = chatRoomsList[index]["chatroom_name"] ?? "";
              String chatroomDesc = chatRoomsList[index]["desc"] ?? "";
              return ListTile(
                // This will help to navigate to next widget that is chatroom widget
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChatroomPage(
                      // Passing the chatroom name and chatroom id
                      chatroomName: chatroomName,
                      chatroomId: chatRoomsIds[index],
                    );
                  }));
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey[900],
                  child: Text(
                    chatroomName.substring(0, 1),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(chatroomName),
                subtitle: Text(chatroomDesc),
              );
            }));
  }
}
