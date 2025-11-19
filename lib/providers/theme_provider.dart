import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/themes/default_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData temaActual;

  ThemeProvider({required bool isDarkMode})
    : temaActual = isDarkMode
          ? DefaultTheme.darkTheme
          : DefaultTheme.lightTheme;

  setLight() {
    temaActual = DefaultTheme.lightTheme;
    notifyListeners();
  }

  setDark() {
    temaActual = DefaultTheme.darkTheme;
    notifyListeners();
  }
}
