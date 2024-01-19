import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/common/styles/themes.dart';
import 'package:news_app/src/news/presentation/screens/archived_screen.dart';
import 'package:news_app/src/news/presentation/screens/favorite_screen.dart';
import 'package:news_app/src/news/presentation/screens/news_screen.dart';
import 'package:news_app/src/news/presentation/screens/settings_screen.dart';

import 'package:news_app/src/news/presentation/manager/news_cubit.dart';
import 'package:news_app/src/news/presentation/manager/news_states.dart';
import 'package:news_app/src/news/presentation/screens/home_screen.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: NewsCubit.get(context).isDarkEnabled
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
