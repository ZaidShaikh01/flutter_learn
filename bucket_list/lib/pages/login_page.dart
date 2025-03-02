import 'package:bucket_list/pages/mainscreen.dart';
import 'package:bucket_list/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userForm = GlobalKey<FormState>();

  // Setting up the text editing controller
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> loginAccount() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text.toString(), password: password.text.toString())
          .then((value) {
        Navigator.pushReplacement((context),
            MaterialPageRoute(builder: (context) => const Mainscreen()));
        setState(() {});
      });
    } catch (e) {
      //return Text("Some Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
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
                          decoration:
                              InputDecoration(label: Text("Password: ")),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // SIgnup button
                        ElevatedButton(
                            onPressed: () {
                              if (userForm.currentState!.validate()) {
                                // Create account
                                loginAccount();
                              }
                            },
                            child: Text("Log in"))
                      ],
                    ))),
            Text("Don't have an account?"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignupScreen();
                }));
              },
              child: Text("Signup now!"),
            ),
          ],
        ),
      ),
    );
  }
}
