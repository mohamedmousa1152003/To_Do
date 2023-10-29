import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String currentLocale = "en";
  ThemeMode currentTheme = ThemeMode.light;

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;

    notifyListeners();
  }

  changeLanguage(String newLanguage) {
    if (currentLocale == newLanguage) return;
    currentLocale = newLanguage;

    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  String backgroundImage() {
    return isDark()
        ? "assets/splash – 1.png"
            : "assets/splash.png" ;
  }
}
