import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/src/news/data/remote/data_sources/news_api_service.dart';
import 'package:news_app/src/news/data/remote/data_sources/news_data_source.dart';
import 'package:news_app/src/news/data/repositories/news_repo_impl.dart';
import 'package:news_app/src/news/domain/use_cases/news_use_case.dart';
import 'package:news_app/src/news/presentation/manager/news_cubit.dart';

import 'core/services/dio_helper.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection(){

  // init dio
  Dio dioHelper = DioHelper.init();

  // register dependencies
  getIt.registerLazySingleton<Dio>(() => dioHelper);
  getIt.registerLazySingleton<NewsApiService>(() => NewsApiService(getIt()));
  getIt.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSource(apiService: getIt()));
  getIt.registerLazySingleton<NewsRepositoryImpl>(() => NewsRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton<NewsUseCase>(() => NewsUseCase(repository: getIt()));
  getIt.registerLazySingleton<NewsCubit>(() => NewsCubit(newsUseCase: getIt()));
}