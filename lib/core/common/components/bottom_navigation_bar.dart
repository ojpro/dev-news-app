import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/bloc/app_cubit.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final double elevation;
  final Color? backgroundColor;
  final bool showUnselectedLabels;
  final bool enableFeedback;
  final bool showSelectedLabels;
  final Color? unselectedItemColor;
  final Color? selectedItemColor;
  final double iconSize;
  final int currentIndex;
  final Function onTapPressed;

  const BottomNavigationBarComponent({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.elevation = 0.0,
    this.enableFeedback = false,
    this.backgroundColor,
    this.showUnselectedLabels = false,
    this.showSelectedLabels = false,
    this.unselectedItemColor,
    this.selectedItemColor,
    this.iconSize = 24,
    required this.onTapPressed,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit newsCubit = context.read<AppCubit>();

    return BottomNavigationBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      showUnselectedLabels: showUnselectedLabels,
      showSelectedLabels: showSelectedLabels,
      unselectedItemColor: unselectedItemColor,
      selectedItemColor: selectedItemColor,
      iconSize: iconSize,
      currentIndex: newsCubit.currentScreenId,
      enableFeedback: enableFeedback,
      items: items,
      onTap: (index) => onTapPressed(index) ?? (index) {},
    );
  }
}
