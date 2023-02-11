import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme;

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? 'dark' : 'light';

  setThemeDark() {
    currentTheme = 'dark';
    notifyListeners();
  }

  setThemeLight() {
    currentTheme = 'light';
    notifyListeners();
  }
}
