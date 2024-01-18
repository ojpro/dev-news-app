import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/common/components/bottom_navigation_bar.dart';

class BasicLayout extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? child;
  final Color statusBarColor;
  final List<BottomNavigationBarItem>? bottomNavigationBarItems;

  const BasicLayout({
    super.key,
    required this.title,
    this.actions,
    this.child,
    this.statusBarColor = Colors.black,
    this.bottomNavigationBarItems,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: actions,
          ),
          body: child,
          bottomNavigationBar: bottomNavigationBarItems == null
              ? null
              : BottomNavigationBarComponent(
                  items: bottomNavigationBarItems ?? [],
                ),
        ),
      ),
    );
  }
}
