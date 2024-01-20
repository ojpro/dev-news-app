import 'news_api_service.dart';

class NewsRemoteDataSource {
  final NewsApiService apiService;

  NewsRemoteDataSource({required this.apiService});

  Future<List<Map<String, dynamic>>> fetchNews(String? category) async {
    try {
      final response = await apiService.getNews(category);

      if (response != null && response.statusCode == 200) {
        final responseData = (response.data as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .toList();

        return responseData;
      } else {
        print(
            '[DataSource] Failed to fetch news. Status code: ${response?.statusCode}');
        return [];
      }
    } catch (error) {
      print('[DataSource] Fetching news error: $error');
      return [];
    }
  }
}
