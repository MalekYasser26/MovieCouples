import 'package:flutter/material.dart';
import 'package:movies_couples_tracker/core/utils/app_colors.dart';
import 'package:movies_couples_tracker/core/utils/app_themes_extension.dart';

class AppTheme {
  // static final springLoveTheme = ThemeData(
  //   useMaterial3: true,
  //   scaffoldBackgroundColor: AppColors.springBackground,
  //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.springPrimary),
  //   extensions: [
  //     const AppThemeExtension(
  //       background: AppColors.springBackground,
  //       primary: AppColors.springPrimary,
  //       accent: AppColors.springAccent,
  //       text: AppColors.springText,
  //       gradient: AppColors.springGradient,
  //     ),
  //   ],
  // );
  //
  // // static final autumnVibesTheme = ThemeData(
  // //   useMaterial3: true,
  // //   scaffoldBackgroundColor: AppColors.autumnBackground,
  // //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.autumnPrimary),
  // //   extensions: [
  // //     const AppThemeExtension(
  // //       background: AppColors.autumnBackground,
  // //       primary: AppColors.autumnPrimary,
  // //       accent: AppColors.autumnAccent,
  // //       text: AppColors.autumnText,
  // //       gradient: AppColors.autumnGradient,
  // //     ),
  // //   ],
  // // );
  // //
  // // static final sunsetGlowTheme = ThemeData(
  // //   useMaterial3: true,
  // //   scaffoldBackgroundColor: AppColors.sunsetBackground,
  // //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.sunsetPrimary),
  // //   extensions: [
  // //     const AppThemeExtension(
  // //       background: AppColors.sunsetBackground,
  // //       primary: AppColors.sunsetPrimary,
  // //       accent: AppColors.sunsetAccent,
  // //       text: AppColors.sunsetText,
  // //       gradient: AppColors.sunsetGradient,
  // //     ),
  // //   ],
  // // );
  //
  // static final sunriseBlushTheme = ThemeData(
  //   useMaterial3: true,
  //   scaffoldBackgroundColor: AppColors.sunriseBackground,
  //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.sunrisePrimary),
  //   extensions: [
  //     const AppThemeExtension(
  //       background: AppColors.sunriseBackground,
  //       primary: AppColors.sunrisePrimary,
  //       accent: AppColors.sunriseAccent,
  //       text: AppColors.sunriseText,
  //       gradient: AppColors.sunriseGradient,
  //     ),
  //   ],
  // );

  // static final cutesyPinkTheme = ThemeData(
  //   useMaterial3: true,
  //   scaffoldBackgroundColor: AppColors.cuteBackground,
  //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.cutePrimary),
  //   extensions: [
  //     const AppThemeExtension(
  //       background: AppColors.cuteBackground,
  //       primary: AppColors.cutePrimary,
  //       accent: AppColors.cuteAccent,
  //       text: AppColors.cuteText,
  //       gradient: AppColors.cuteGradient,
  //     ),
  //   ],
  // );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightAccent,
    ),
    extensions: [
      const AppThemeExtension(
        background: AppColors.lightBackground,
        primary: AppColors.lightPrimary,
        accent: AppColors.lightAccent,
        text: AppColors.lightText,
        gradient: AppColors.lightGradient,
      ),
    ],
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkAccent,
    ),
    extensions: [
      const AppThemeExtension(
        background: AppColors.darkBackground,
        primary: AppColors.darkPrimary,
        accent: AppColors.darkAccent,
        text: AppColors.darkText,
        gradient: AppColors.darkGradient,
      ),
    ],
  );

  static AppThemeExtension? getExtensionByName(String name) {
    final theme = getThemeDataByName(name);
    return theme.extension<AppThemeExtension>();
  }

  static ThemeData getThemeDataByName(String name) {
    switch (name.toLowerCase()) {
      // case 'spring':
      //   return springLoveTheme;
      // case 'autumn':
      //   return autumnVibesTheme;
      // case 'sunset':
      //   return sunsetGlowTheme;
      // case 'sunrise':
      //   return sunriseBlushTheme;
      // case 'cute':
      //   return cutesyPinkTheme;
      case 'light':
        return lightTheme;
      case 'dark':
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
