import 'package:flutter/material.dart';

Text textComponent({
  required String text,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 16.0,
}) =>
    Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
