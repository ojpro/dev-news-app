import 'package:flutter/material.dart';
import 'package:news_app/src/app.dart';

abstract class AppStates {
  const AppStates();
}

class AppInitState extends AppStates {}

// # App

// Screens
class AppScreenChangedState extends AppStates {
  static Widget nextScreen = const NewsApp();

  AppScreenChangedState(Widget screen) {
    nextScreen = screen;
  }
}

// Bottom Navigation
class BottomNavigationBarStateChangedState extends AppStates {}

// Theme
class AppThemeChangedState extends AppStates {}