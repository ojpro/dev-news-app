import 'package:news_app/src/news/data/remote/data_sources/news_data_source.dart';
import 'package:news_app/src/news/domain/entities/news_entity.dart';

import '../../domain/repositories/news_repo.dart';

class NewsRepositoryImpl implements NewsRepository{
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<NewsEntity>> getNews(String? category) async {

   try{
     final List<Map<String, dynamic>> newsData = await remoteDataSource.fetchNews(category);

     final List<NewsEntity> newsEntityList = newsData.map<NewsEntity>((dynamic data) => NewsEntity.fromMap(data as Map<String, dynamic>)).toList();

     return newsEntityList;

   }catch(error){
     print('[RepoImp] Fetching news error: $error');
     return [];
   }
  }

}