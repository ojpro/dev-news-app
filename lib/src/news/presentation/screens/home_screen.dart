import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/bloc/app_cubit.dart';
import 'package:news_app/core/bloc/app_states.dart';
import 'package:news_app/src/news/presentation/screens/settings_screen.dart';

import '../../../../core/common/layouts/basic_layout.dart';

import '../screens/archived_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/news_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> bottomNavBarScreens = const [
    NewsScreen(),
    FavoriteScreen(),
    ArchivedScreen(),
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppScreenChangedState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AppScreenChangedState.nextScreen));
        }
      },
      builder: (context, state) {
        AppCubit newsCubit = AppCubit.get(context);
        return BasicLayout(
          title: 'News App',
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings_rounded,
              ),
              onPressed: () {
                newsCubit.changeScreen(SettingsScreen());
              },
            ),
          ],
          bottomNavigationBarItems: _bottomNavigationItems(),
          onBottomNavBarTapPressed: (index) {
            newsCubit.changeCurrentScreenId(index);
          },
          child: bottomNavBarScreens[newsCubit.currentScreenId],
        );
      },
    );
  }

  // List all screens for the Bottom Navigation Bar
  List<BottomNavigationBarItem> _bottomNavigationItems() {
    item(
      String label,
      IconData icon,
      IconData activeIcon,
    ) =>
        BottomNavigationBarItem(
          label: label,
          activeIcon: Icon(
            activeIcon,
          ),
          icon: Icon(icon),
        );

    return [
      item('Favorite', Icons.home_outlined, Icons.home),
      item('Favorite', Icons.favorite_border_outlined, Icons.favorite),
      item('Archived', Icons.archive_outlined, Icons.archive),
    ];
  }
}
