import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData {
    // Return the appropriate ThemeData based on _isDarkMode
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    // Add logic to switch the app theme based on _isDarkMode
    notifyListeners();
  }
}
