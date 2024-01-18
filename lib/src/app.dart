import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/common/styles/themes.dart';
import 'package:news_app/src/news/presentation/screens/archived_screen.dart';
import 'package:news_app/src/news/presentation/screens/favorite_screen.dart';
import 'package:news_app/src/news/presentation/screens/news_screen.dart';

import '../core/common/layouts/basic_layout.dart';
import 'news/presentation/manager/news_cubit.dart';
import 'news/presentation/manager/news_states.dart';


class NewsApp extends StatelessWidget {
  final List<Widget> screensList = const [
    NewsScreen(),
    FavoriteScreen(),
    ArchivedScreen(),
  ];

  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
      home: BlocProvider<NewsCubit>(
        create: (context) => NewsCubit(),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) => {},
          builder: (context, state) {
            NewsCubit newsCubit = NewsCubit.get(context);
            return BasicLayout(
              title: 'News App',
              actions: const [
                Icon(
                  Icons.settings_rounded,
                ),
              ],
              bottomNavigationBarItems: _bottomNavigationItems(),
              onBottomNavBarTapPressed: (index) {
                newsCubit.changeCurrentScreenId(index);
              },
              child: screensList[newsCubit.currentScreenId],
            );
          },
        ),
      ),
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
