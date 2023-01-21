import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xFF121312);
  static const Color secondaryColor = Color(0xFF282A28);
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: const AppBarTheme(color: primaryColor, elevation: 0),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 15,
      backgroundColor: secondaryColor,
      selectedIconTheme: IconThemeData(
        color: Color(0xFFFFBB3B),
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFC6C6C6),
      ),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: Color(0xFFFFBB3B),
      unselectedItemColor: Color(0xFFC6C6C6),
      selectedLabelStyle: TextStyle(
        color: Color(0xFFFFBB3B),
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
      unselectedLabelStyle: TextStyle(
        color: Color(0xFFC6C6C6),
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    ),
  );
}
