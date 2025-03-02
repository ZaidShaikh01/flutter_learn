import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeChanged = false;
  String dataToUpadte = "Hello world from the gloabal state";

  Future<void> updateMode({required bool darkMode}) async {
    //dataToUpadte = data;
    // To make everyone aware of the changed state...
    // It's like a chage state but for global variable.
    isDarkModeChanged = darkMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an boolean value to 'repeat' key.
    prefs.setBool('isDarkModeChanged', darkMode);

    notifyListeners();
  }

  Future<void> loadMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkModeChanged = prefs.getBool('isDarkModeChanged') ?? true;
    // Act as set State but for global variables
    notifyListeners();
  }
}
