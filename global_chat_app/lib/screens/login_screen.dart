import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:global_chat_app/controllers/login_controller.dart';
import 'package:global_chat_app/controllers/signup_controller.dart';
import 'package:global_chat_app/screens/dashboard_screen.dart';
import 'package:global_chat_app/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  // Setting up the text editing controller
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // User form key
  var userForm = GlobalKey<FormState>();

  // Loading screen
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Login Page"),
      // ),
      // using the form widget
      body: Form(
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
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(0, 50),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.deepPurpleAccent),
                        onPressed: () async {
                          // When the login procedure has started
                          isLoading = true;
                          setState(() {});
                          if (userForm.currentState!.validate()) {
                            // Creating an account
                            await LoginController.login(
                                // We are gettin and passing the data in login controller dart file
                                context: context,
                                password: password.text.toString(),
                                email: email.text.toString());

                            // When the login procedure has finished

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
                            : Text("Login")),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignupScreen();
                      }));
                    },
                    child: Text(
                      "Signup here!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
