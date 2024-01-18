import 'package:flutter/material.dart';

ThemeData lightTheme({
  Color scaffoldBackgroundColor = Colors.white,
  Color appBarBackground = Colors.white,
  Color appBarTitleColor = Colors.black,
}) =>
    ThemeData(
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        titleTextStyle: TextStyle(
          color: appBarTitleColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.black54,
        ),
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 20.0,
        backgroundColor: Color(0xFFFCFCFC),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Colors.black54,
        ),
      ),
    );

ThemeData darkTheme({
  Color scaffoldBackgroundColor = Colors.black,
  Color appBarBackground = Colors.black,
  Color appBarTitleColor = Colors.white,
}) =>
    ThemeData(
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        titleTextStyle: TextStyle(
          color: appBarTitleColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.grey.shade200,
        ),
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 20.0,
        backgroundColor: const Color(0xFF101010),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Colors.grey.shade500,
        ),
      ),
    );
