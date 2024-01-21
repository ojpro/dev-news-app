import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/common/styles/themes.dart';

import 'package:news_app/core/bloc/app_cubit.dart';
import 'package:news_app/core/bloc/app_states.dart';
import 'package:news_app/core/services/cache_helper.dart';
import 'package:news_app/src/news/presentation/screens/home_screen.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {

    bool? isDarkModeEnabled = CacheHelper.getBool('isDark');
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit()..changeTheme(isDarkModeEnabled),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: AppCubit.get(context).isDarkEnabled
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
