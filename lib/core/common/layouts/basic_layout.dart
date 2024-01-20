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
  final bool? centerTitle;
  final int? bottomNavigationBarCurrentIndex;


  BasicLayout({
    super.key,
    required this.title,
    this.actions,
    this.child,
    this.statusBarColor = Colors.black,
    this.bottomNavigationBarItems,
    this.onBottomNavBarTapPressed,
    this.centerTitle = false,
    this.bottomNavigationBarCurrentIndex,
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
            centerTitle: centerTitle,
            actions: actions,
          ),
          body: child,
          bottomNavigationBar: bottomNavigationBarItems == null
              ? null
              : BottomNavigationBarComponent(
                  currentIndex: bottomNavigationBarCurrentIndex ?? 0,
                  onTapPressed: (index) => onBottomNavBarTapPressed!(index),
                  items: bottomNavigationBarItems ?? [],
                ),
        ),
      ),
    );
  }
}
