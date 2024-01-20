import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/news/domain/use_cases/news_use_case.dart';
import 'package:news_app/src/news/presentation/manager/news_states.dart';

import '../../domain/entities/news_entity.dart';

class NewsCubit extends Cubit<NewsStates> {
  final NewsUseCase newsUseCase;
  List<String> newsCategories = [
    'General',
    'Business',
    'Technology',
    'Entertainment',
    'Health',
    'Science',
    'Sports'
  ];

  NewsCubit({required this.newsUseCase}) : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  // fetching news data
  Future<void> fetchNews() async {
    try {
      emit(NewsLoadingState());

      final List<NewsEntity> newsData = await newsUseCase.getNews();

      emit(NewsLoadedState(newsData));
    } catch (error) {
      emit(NewsErrorState('Fetching news error: $error'));
    }
  }
}
