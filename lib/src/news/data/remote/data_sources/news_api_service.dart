import 'package:dio/dio.dart';

class NewsApiService {
  final Dio dioHelper;

  NewsApiService(this.dioHelper);

  Future<Response<dynamic>?> getNews() async {
    try {
      return await dioHelper.get(
        '/articles',
        queryParameters: {
          'top': 30
        }
      );
    } catch (error) {
      print('[API] Fetching news error: $error');
      return null;
    }
  }
}
