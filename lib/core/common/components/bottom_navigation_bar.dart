import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/news/presentation/manager/news_cubit.dart';
import 'package:news_app/src/news/presentation/manager/news_states.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final double elevation;
  final Color backgroundColor;
  final bool showUnselectedLabels;
  final bool showSelectedLabels;
  final Color unselectedItemColor;
  final Color selectedItemColor;
  final double iconSize;
  final int? currentIndex;

  const BottomNavigationBarComponent({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.elevation = 0.0,
    this.backgroundColor = Colors.white,
    this.showUnselectedLabels = false,
    this.showSelectedLabels = false,
    this.unselectedItemColor = Colors.grey,
    this.selectedItemColor = Colors.black,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (BuildContext context, NewsStates state) {
          NewsCubit newsCubit = NewsCubit.get(context);

          return BottomNavigationBar(
            elevation: elevation,
            backgroundColor: backgroundColor,
            showUnselectedLabels: showUnselectedLabels,
            showSelectedLabels: showSelectedLabels,
            unselectedItemColor: unselectedItemColor,
            selectedItemColor: selectedItemColor,
            iconSize: iconSize,
            currentIndex: newsCubit.currentScreenId,
            enableFeedback: false,
            items: items,
            onTap: (index) {
              newsCubit.changeCurrentScreenId(index);
            },
          );
        },
        listener: (BuildContext context, NewsStates state) => {},
      ),
    );
  }
}
