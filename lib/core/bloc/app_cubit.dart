import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/bloc/app_states.dart';
import 'package:news_app/core/services/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  // Properties
  int currentScreenId = 0;
  bool isDarkEnabled = false;

  // Class Related Methods
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  // Public use methods
  void changeCurrentScreenId(int id) {
    currentScreenId = id;
    emit(BottomNavigationBarStateChangedState());
  }

  // Emit Screen Change
  void changeScreen(Widget nextScreen) {
    emit(AppScreenChangedState(nextScreen));
  }

  // Change App Theme
  void changeTheme(bool? enabledDark) {
    isDarkEnabled = enabledDark ?? isDarkEnabled;

    // store the selected theme locally
    CacheHelper.putBool('isDark', enabledDark).then(
      (_) => emit(AppThemeChangedState()),
    );
  }
}
