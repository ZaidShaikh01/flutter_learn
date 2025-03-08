import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:global_chat_app/controllers/signup_controller.dart';
import 'package:global_chat_app/screens/dashboard_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  // Setting up the text editing controller
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();

  // Addig the user form key

  var userForm = GlobalKey<FormState>();

  // Loading indicator
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(""),
      ),
      // using the form widget
      body: SingleChildScrollView(
        child: Form(
          // Setting yp the key for form
          key: userForm,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/logo.png")),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                ),
                SizedBox(height: 23),
                // Password field
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  // TO hide the texts
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name ",
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: country,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your country";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Country ",
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 50),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.deepPurpleAccent),
                          onPressed: () async {
                            // When the button is pressed the circular indicator will be shown
                            isLoading = true;
                            setState(() {});
                            if (userForm.currentState!.validate()) {
                              // Creating an account
                              await SignupController.createAccount(
                                  context: context,
                                  password: password.text.toString(),
                                  email: email.text.toString(),
                                  name: name.text.toString(),
                                  country: country.text.toString());
                              // Once the account is created, the loading indicator will be removed
                              isLoading = false;
                              setState(() {});
                            }
                          },
                          child: isLoading
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text("Create Account!")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
