import 'package:news_app/src/news/data/repositories/news_repo_impl.dart';

import '../entities/news_entity.dart';

class NewsUseCase {
  final NewsRepositoryImpl repository;

  NewsUseCase({required this.repository});

  Future<List<NewsEntity>> getNews(String? category) async {
    return await repository.getNews(category);
  }
}
