import 'package:flutter/material.dart';
import 'package:shop_app/Themes/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

// getter
  ThemeData get themeData => _themeData;

//setter

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

//function to change Theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
