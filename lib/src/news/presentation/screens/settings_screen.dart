import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/common/components/box.dart';
import 'package:news_app/core/common/layouts/basic_layout.dart';
import 'package:news_app/src/news/presentation/manager/news_cubit.dart';
import 'package:news_app/src/news/presentation/manager/news_states.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) => {},
        builder: (BuildContext context, NewsStates state) {
          NewsCubit newsCubit = NewsCubit.get(context);
          return BasicLayout(
            title: 'Settings',
            centerTitle: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  child: boxComponent(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    borderRadius: 4,
                    child: Row(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            child: Text('Dark Theme'),
                          ),
                        ),
                        Switch(
                          value: newsCubit.getCurrentTheme(),
                          onChanged: (value) {
                            newsCubit.changeTheme(value);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
