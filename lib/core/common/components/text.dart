import 'package:flutter/material.dart';

Text textComponent({
  required String text,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 16.0,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? overflow,
  bool? wrap = true,

}) =>
    Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: wrap,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
