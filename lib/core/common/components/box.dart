import 'package:flutter/material.dart';

Widget boxComponent({
  required Widget child,
  List<double> padding = const [0, 0, 0, 0],
  Color backgroundColor = Colors.black,
  double borderRadius = 0,
}) =>
    Container(
      padding: EdgeInsetsDirectional.only(
        top: padding[0],
        end: padding[1],
        bottom: padding[2],
        start: padding[3],
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: child,
    );
