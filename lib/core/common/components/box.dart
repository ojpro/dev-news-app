import 'package:flutter/material.dart';

Widget boxComponent({
  required Widget child,
  EdgeInsets? padding,
  Color? backgroundColor,
  double borderRadius = 0,
  List<BoxShadow>? boxShadow,
}) =>
    Container(
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: child,
    );
