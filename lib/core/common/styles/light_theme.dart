import 'package:flutter/material.dart';

ThemeData lightTheme({
  Color scaffoldBackgroundColor = Colors.white,
  Color appBarBackground = Colors.white,
  Color appBarTitleColor = Colors.black,
}) =>
    ThemeData(
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground,
        titleTextStyle: TextStyle(
          color: appBarTitleColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
