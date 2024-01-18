import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/app.dart';

import 'core/common/states/bloc_observer.dart';

void main(){
  Bloc.observer = AppBlocObserver();
  runApp(const NewsApp());
}