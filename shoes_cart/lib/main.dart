import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_cart/cart_provider.dart';
import 'package:shoes_cart/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            textTheme: TextTheme(
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              titleMedium: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            fontFamily: 'Poppins',
      
            // We are going to mention only one color and baseed on that whole color scheme will be genrated
      
            // We need to mention a seed color and based on that all other colors will be derived
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromRGBO(254, 206, 1, 1),
              // Overiding the primary color
              primary: Color.fromRGBO(254, 206, 1, 1),
            ),
      
            // This is cuz we want same design for all the text field we create
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                prefixIconColor: Color.fromRGBO(119, 119, 119, 1))),
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
