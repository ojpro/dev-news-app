import 'package:flutter/material.dart';
import 'package:news_app/src/app.dart';

class NewsStates {}

class NewsInitState extends NewsStates {}

// # App

// Screens
class AppScreenChangedState extends NewsStates {
  static Widget nextScreen = const NewsApp();

  AppScreenChangedState(Widget screen) {
    nextScreen = screen;
  }
}

// Bottom Navigation
class BottomNavigationBarStateChangedState extends NewsStates {}

// Theme

class AppThemeChangedState extends NewsStates {}
