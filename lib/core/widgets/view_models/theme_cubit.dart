import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_couples_tracker/core/utils/app_themes.dart';
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.lightTheme); // default theme
  void setTheme(String themeName) {
    switch (themeName.toLowerCase()) {
      // case 'spring':
      //   emit(AppTheme.springLoveTheme);
      //   break;
      // case 'autumn':
      //   emit(AppTheme.autumnVibesTheme);
      //   break;
      case 'light':
        emit(AppTheme.lightTheme);
        break;
      case 'dark':
        emit(AppTheme.darkTheme);
        break;
      // case 'sunset':
      //   emit(AppTheme.sunsetGlowTheme);
      //   break;
      // case 'sunrise':
      //   emit(AppTheme.sunriseBlushTheme);
      //   break;
      // case 'cute':
      //   emit(AppTheme.cutesyPinkTheme);
      //   break;
      default:
        emit(AppTheme.lightTheme);
        break;
    }
  }
}
