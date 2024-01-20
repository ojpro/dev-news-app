import 'package:dio/dio.dart';

class NewsApiService {
  final Dio dioHelper;

  NewsApiService(this.dioHelper);

  Future<Response<dynamic>?> getNews(String? category) async {
    try {
      return await dioHelper.get(
        '/articles',
        queryParameters: {
          'top': 30,
          'tag': category,
        }
      );
    } catch (error) {
      print('[API] Fetching news error: $error');
      return null;
    }
  }
}
