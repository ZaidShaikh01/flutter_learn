import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:global_chat_app/providers/userProvider.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Text editing controller
  TextEditingController nameText = TextEditingController();
  // We are getting map data

  Map<String, dynamic>? userData = {};

  // To have access to the form we need to have form key
  var editProfileForm = GlobalKey<FormState>();

  // Initialising the firebase database
  var db = FirebaseFirestore.instance;

  /// This function is called when the widget is inserted into the tree.
  /// The value of the text field is set to the current user's name.
  /// The super class's initState is also called.
  @override
  void initState() {
    // TODO: implement initState

    nameText.text = Provider.of<UserProvider>(context, listen: false).userName;
    super.initState();
  }

  /// Updates the user's name in the database and reloads the user's details.
  ///
  /// This function is called when the user clicks the "Update" button in the
  /// Edit Profile screen. It updates the user's name in the database and reloads
  /// the user's details by calling the `getUserDetails()` function of the
  /// `UserProvider` class. Finally, it pops the Edit Profile screen from the
  /// navigator.
  void updateData() {
    // Data to be update

    Map<String, dynamic> data = {"name": nameText.text};
    // Here we will update the data in the database
    db
        .collection("users")
        .doc(Provider.of<UserProvider>(context, listen: false).userId)
        .update(data);
    Provider.of<UserProvider>(context, listen: false).getUserDetails();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // We are bringing the UserProvide provider in this screen

    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
        actions: [
          InkWell(
            onTap: () {
              // Adding a validator to validate the form value
              if (editProfileForm.currentState!.validate()) {
                // Updating the user name
                updateData();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.save),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: editProfileForm,
            child: Column(children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  // This validator tells that name can not be empty

                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                controller: nameText,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  labelText: "Name",
                  hintText: "Enter your name",
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
