import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  var userForm = GlobalKey<FormState>();

  Future<void> createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.toString(), password: password.text.toString());
      print("Account created successfully!!");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return DashboardScreen();
      }), (route) {
        return false;
      });
    } catch (e) {
      // Snakbar
      SnackBar messageSnakBar = SnackBar(
          backgroundColor: Colors.red[200], content: Text(e.toString()));

      ScaffoldMessenger.of(context).showSnackBar(messageSnakBar);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signup Page"),
      ),
      // using the form widget
      body: Form(
        // Setting yp the key for form
        key: userForm,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  labelText: "Email: ",
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
              ElevatedButton(
                  onPressed: () {
                    if (userForm.currentState!.validate()) {
                      // Creating an account
                      createAccount();
                    }
                  },
                  child: Text("Create Account!")),
            ],
          ),
        ),
      ),
    );
  }
}
