import 'package:flutter/material.dart';

Widget boxComponent({
  Widget? child,
  EdgeInsets? padding,
  Color? backgroundColor,
  double borderRadius = 0,
  List<BoxShadow>? boxShadow,
  double? width,
  double? height,
  DecorationImage? backgroundImage,
}) =>
    Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: backgroundColor,
        image: backgroundImage,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: child,
    );
