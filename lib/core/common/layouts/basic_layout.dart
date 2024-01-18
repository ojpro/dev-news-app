import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/common/components/bottom_navigation_bar.dart';

class BasicLayout extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? child;
  final Color statusBarColor;
  final List<BottomNavigationBarItem>? bottomNavigationBarItems;
  Function(int)? onBottomNavBarTapPressed;

   BasicLayout({
    super.key,
    required this.title,
    this.actions,
    this.child,
    this.statusBarColor = Colors.black,
    this.bottomNavigationBarItems,
     this.onBottomNavBarTapPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
        ),
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text(title),
            actions: actions,
          ),
          body: child,
          bottomNavigationBar: bottomNavigationBarItems == null
              ? null
              : BottomNavigationBarComponent(
                  onTapPressed: (index) => onBottomNavBarTapPressed!(index),
                  items: bottomNavigationBarItems ?? [],
                ),
        ),
      ),
    );
  }
}
