import 'package:flutter/material.dart';
import 'package:musicapp/themes/dark_mode.dart';
import 'package:musicapp/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Initially light mode
  ThemeData _themeData = lightMode;

  // Get current theme
  ThemeData get themeData => _themeData;

  // Check if dark mode is active
  bool get isDarkMode => _themeData == darkMode;

  // Set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners(); // Notify the UI to rebuild
  }

  // Toggle between light and dark mode
  void toggleTheme() {
    themeData = isDarkMode ? lightMode : darkMode;
  }
}
