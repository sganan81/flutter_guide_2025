import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primary = Colors.blue;
  static const Color primaryDark = Colors.green;
  static const Color secondary = Colors.grey;
  static final Color primaryHover = Colors.red.shade600;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.amber,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: secondary,
        foregroundColor: Colors.white,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(style: EstiloBotones()),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primary,
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: primary,
      textColor: Colors.black,
      selectedColor: primary,
    ),
    /* switchTheme: SwitchThemeData(), */
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );

  static ButtonStyle EstiloBotones() {
    return TextButton.styleFrom(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    );
  }

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.greenAccent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryDark,
      foregroundColor: Colors.white,
    ),
  );
}
