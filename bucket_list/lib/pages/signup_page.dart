import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var userForm = GlobalKey<FormState>();

  // Setting up the text editing controller
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.toString(), password: password.text.toString());

      print("Account created successfully!! ");
    } catch (e) {
      //return Text("Some Error");
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

      // Using the FOrm variable to set up the login/ SIgn up page
      body: Form(
        // Setting up the form key to use the page

        key: userForm,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Email field
              TextFormField(
                controller: email,
                // Validator argument

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text("Email: ")),
              ),
              SizedBox(
                height: 23,
              ),

              // Password Field
              TextFormField(
                controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
                // TO hide the texts
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(label: Text("Password: ")),
              ),
              SizedBox(
                height: 10,
              ),

              // SIgnup button
              ElevatedButton(
                  onPressed: () {
                    if (userForm.currentState!.validate()) {
                      // Create account
                      createAccount();
                    }
                  },
                  child: Text("Create Account!"))
            ],
          ),
        ),
      ),
    );
  }
}
