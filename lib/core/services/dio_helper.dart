import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dev.to/api',
        receiveDataWhenStatusError: true,
      ),
    );
    return dio;
  }

  // fetch data
  static Future<Response<dynamic>?> get({
    required String url,
    Map<String, dynamic>? queries,
  }) async {
    return await dio?.get(url, queryParameters: queries);
  }
}
