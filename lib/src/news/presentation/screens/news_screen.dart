import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di.dart';
import 'package:news_app/src/news/presentation/manager/news_cubit.dart';
import 'package:news_app/src/news/presentation/manager/news_states.dart';
import 'package:news_app/src/news/presentation/screens/webview_screen.dart';
import 'package:news_app/src/news/presentation/widgets/badge.dart';
import 'package:news_app/src/news/presentation/widgets/news_card.dart';

import '../../../../core/bloc/app_cubit.dart';
import '../../domain/entities/news_entity.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => getIt()..fetchNews(null),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit newsCubit = NewsCubit.get(context);
          List<NewsEntity> news = [];
          if (state is NewsLoadedState) {
            news = state.props.whereType<NewsEntity>().toList();
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      bool isSelected = newsCubit.newsCategories[index] ==
                          newsCubit.currentCategory;
                      return GestureDetector(
                        child: badgeComponent(
                          text: newsCubit.newsCategories[index],
                          isSelected: isSelected,
                        ),
                        onTap: () {
                          // toggle select state
                          if (isSelected) {
                            newsCubit.changeCategory(null);
                          } else {
                            newsCubit.changeCategory(
                                newsCubit.newsCategories[index]);
                          }
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 4,
                    ),
                    itemCount: newsCubit.newsCategories.length,
                  ),
                ),
                ConditionalBuilder(
                  condition: state is NewsLoadedState,
                  builder: (context) {
                    AppCubit appCubit = context.read<AppCubit>();
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              appCubit.changeScreen(WebViewScreen(title: news[index].title, url: news[index].url,));
                            },
                            child: newsCardComponent(
                              title: news[index].title,
                              imageUrl: news[index].coverImage ?? '',
                              publishedAt: news[index].publishedAt,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                        itemCount: news.length,
                      ),
                    );
                  },
                  fallback: (BuildContext buildContext) => SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: MediaQuery.of(context).size.width,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
