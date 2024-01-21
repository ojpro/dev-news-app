import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/services/cache_helper.dart';
import 'package:news_app/src/app.dart';

import 'core/common/states/bloc_observer.dart';
import 'di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  await CacheHelper.init();

  setupDependencyInjection();

  runApp(const NewsApp());
}