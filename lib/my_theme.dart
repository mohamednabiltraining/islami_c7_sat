import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color primaryColorDark = Color(0xFF141A2E);
  static const Color yellow = Color(0xFFFACC1D);
  static ThemeData lightTheme = ThemeData(
      cardColor: Colors.white,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
      accentColor: primaryColor,
      textTheme: TextTheme(
          headline4: TextStyle(fontSize: 28, color: Colors.black),
          headline6: TextStyle(fontSize: 18, color: Colors.black)),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600),
          iconTheme: IconThemeData(color: Colors.black)),
      bottomAppBarTheme: BottomAppBarTheme(color: primaryColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false),
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black));
  static ThemeData darkTheme = ThemeData(
      cardColor: primaryColorDark,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: primaryColorDark),
      accentColor: yellow,
      textTheme: TextTheme(
          headline4: TextStyle(fontSize: 28, color: Colors.white),
          headline6: TextStyle(fontSize: 18, color: Colors.white)),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          iconTheme: IconThemeData(color: Colors.white)),
      bottomAppBarTheme: BottomAppBarTheme(color: primaryColorDark),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: yellow,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false),
      primaryColor: primaryColorDark);
}
