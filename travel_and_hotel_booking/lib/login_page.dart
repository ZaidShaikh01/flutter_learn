import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
/*
            Color(0xFFE5B2CA), // Light pinkish shade
            Color(0xFFCD82DE), // Purple shade
            Color(0xFF78258B), // Dark purple shade

 */
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE5B2CA), // Light pinkish shade
              Color(0xFFCD82DE), // Purple shade
            ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/login_image.png'),
                SizedBox(height: 20,),
                Text('Welcome Back!', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
                Text('Please, Log In.', style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 20,),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(40),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'abc@gmail.com',
                      prefixIcon: Icon(Icons.person),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color:Colors.white),
                  
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(40),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '*****',
                      prefixIcon: Icon(Icons.key),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color:Colors.white),
            
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Color(0xFF78258B),
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      ),
                      onPressed: (){}, child: Text('Continue >', style: TextStyle(
                    color: Colors.white,
                  ),)),
                ),
                SizedBox(height: 20,),
                Text('---------- Or ----------',
                style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 5),),
            
                SizedBox(height: 50,),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      ),
                      onPressed: (){}, child: Text('Create an Account', style: TextStyle(
                    color: Colors.black,
                  ),)),
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}