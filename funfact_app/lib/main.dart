import 'package:flutter/material.dart';
import 'package:funfact_app/providers/theme_provider.dart';
import 'package:funfact_app/screens/mainscreen.dart';
import 'package:provider/provider.dart';

void main() {
  // This is the provider
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  /// Initializes the state of the widget.
  ///
  /// This method is called when the widget is inserted into the widget tree.
  /// It loads the theme mode from persistent storage using the `ThemeProvider`.

  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ThemeProvider>(context, listen: false).loadMode();
  }

  @override
  Widget build(BuildContext context) {
    // As it requires the context, Always place this inside a widget
    // Here Provider.of<Provider name>(context)
    var themeProvider = Provider.of<ThemeProvider>(context);
    // THis is the consumer
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkModeChanged
          ? ThemeData.dark(
              useMaterial3: true,
            )
          : ThemeData.light(
              useMaterial3: true,
            ),
      home: Mainscreen(),
    );
  }
}
