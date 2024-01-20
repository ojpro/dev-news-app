import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/news/domain/use_cases/news_use_case.dart';
import 'package:news_app/src/news/presentation/manager/news_states.dart';

import '../../domain/entities/news_entity.dart';

class NewsCubit extends Cubit<NewsStates> {
  final NewsUseCase newsUseCase;
  List<String> newsCategories = [
    'webdev',
    'Business',
    'programming',
    'productivity',
    'machinelearning',
    'mobile',
    'blockchain',
    'laravel',
    'flutter',
    'startup',
    'gamedev',
    'performance',
    'cryptocurrency',
  ];
  String? currentCategory;

  NewsCubit({required this.newsUseCase}) : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  // fetching news data
  Future<void> fetchNews(String? category) async {
    try {
      emit(NewsLoadingState());

      final List<NewsEntity> newsData = await newsUseCase.getNews(category);

      emit(NewsLoadedState(newsData));
    } catch (error) {
      emit(NewsErrorState('Fetching news error: $error'));
    }
  }

  // change category

  void changeCategory(String? category){
    // change articles category
    currentCategory = category;

    // inject a state change
    emit(NewsCategoryStateChangedState());

    // fetch new articles based on the selected category
    fetchNews(category);
  }
}
