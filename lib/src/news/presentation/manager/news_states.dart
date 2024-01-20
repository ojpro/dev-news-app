import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/src/news/domain/entities/news_entity.dart';

abstract class NewsStates extends Equatable {
  final List<NewsEntity> ? news;

  const NewsStates({this.news});

  @override
  List<Object> get props => [];
}

class NewsInitState extends NewsStates {}

// Category
class NewsCategoryStateChangedState extends NewsStates {}

// Data
class NewsLoadingState extends NewsStates {}

class NewsLoadedState extends NewsStates {
  final List<NewsEntity> newsList;

  const NewsLoadedState(this.newsList);

  @override
  List<NewsEntity> get props => newsList;
}

class NewsErrorState extends NewsStates {
  final String errorMessage;

  const NewsErrorState(this.errorMessage);
}
