import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/common/styles/themes.dart';
import 'package:news_app/src/news/presentation/screens/archived_screen.dart';
import 'package:news_app/src/news/presentation/screens/favorite_screen.dart';
import 'package:news_app/src/news/presentation/screens/news_screen.dart';
import 'package:news_app/src/news/presentation/screens/settings_screen.dart';

import '../core/common/layouts/basic_layout.dart';
import 'news/presentation/manager/news_cubit.dart';
import 'news/presentation/manager/news_states.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit(),
      child: MaterialAppBuilder(),
    );
  }
}

class MaterialAppBuilder extends StatelessWidget {
  final List<Widget> screensList = const [
    NewsScreen(),
    FavoriteScreen(),
    ArchivedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        NewsCubit newsCubit = NewsCubit.get(context);
        ThemeMode themeMode =
            newsCubit.getCurrentTheme() ? ThemeMode.dark : ThemeMode.light;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          themeMode: themeMode,
          home: BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {
              if (state is AppScreenChangedState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppScreenChangedState.nextScreen,
                  ),
                );
              }
            },
            builder: (context, state) {
              newsCubit = NewsCubit.get(context);
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
                child: screensList[newsCubit.currentScreenId],
              );
            },
          ),
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
