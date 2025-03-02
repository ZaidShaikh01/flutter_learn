import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeChanged = false;
  String dataToUpadte = "Hello world from the gloabal state";

  void updateMode({required bool darkMode}) {
    //dataToUpadte = data;
    // To make everyone aware of the changed state...
    // It's like a chage state but for global variable.
    isDarkModeChanged = darkMode;

    notifyListeners();
  }
}
 