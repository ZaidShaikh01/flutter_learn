import 'package:firebase_demo_app/Clipper/clipper.dart';
import 'package:flutter/material.dart';

class LoginSceen extends StatelessWidget {
  const LoginSceen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    Widget _buildEmail() {
      return Container(
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            color: Colors.grey.shade200,
            blurRadius: 6,
          ),
        ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Email';
            }
          },
          controller: emailController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefix: Icon(Icons.lock_outline_rounded),
            hintText: 'Enter your email',
          ),
        ),
      );
    }

    Widget _buildPassword() {
      return Container(
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            color: Colors.grey.shade200,
            blurRadius: 6,
          ),
        ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Password';
            }
          },
          controller: passwordController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefix: Icon(Icons.email_outlined),
            hintText: 'Enter your password',
          ),
        ),
      );
    }

    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 300),
              painter: RPSCustomPainter(),
            ),
            Positioned(
              top: 16,
              right: -5,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 300),
                painter: RPSCustomPainter(),
              ),
            ),
            Positioned(
              top: 220,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please sign in to continue.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 25,
              ),
              _buildEmail(),
              const SizedBox(
                height: 25,
              ),
              _buildPassword(),
              const SizedBox(
                height: 25,
              ),
              const Text('FORGET', style: TextStyle(),)
            ],
          ),
        ),
      ],
    ));
  }
}
