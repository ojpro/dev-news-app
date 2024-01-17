import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? child;

  const BasicLayout({
    super.key,
    required this.title,
    this.actions,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: actions,
        ),
        body: child,
      ),
    );
  }
}
