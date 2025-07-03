import 'package:flutter/material.dart';

abstract class AppColors {
  // 🌸 Spring Love Theme
  static const Color springBackground = Color(0xFFFFF8F1);
  static const Color springPrimary = Color(0xFFFCB5AC); // Soft coral
  static const Color springAccent = Color(0xFFFFC1A1); // Peach
  static const Color springText = Color(0xFF3A3A3A);
  static const List<Color> springGradient = [
    Color(0xFFFFE5DC),
    Color(0xFFFFC9B9),
    Color(0xFFFFAD94),
  ];

  // 🌞 Sunrise Blush Theme
  static const Color sunriseBackground = Color(0xFFFFF3F7);
  static const Color sunrisePrimary = Color(0xFFFFA3B5); // Soft rose
  static const Color sunriseAccent = Color(0xFFFFE0E9); // Pale pink
  static const Color sunriseText = Color(0xFF5D4037);
  static const List<Color> sunriseGradient = [
    Color(0xFFFFD6E8),
    Color(0xFFFFA3B5),
    Color(0xFFF280A1),
  ];

  // 🌤 Light Theme (improved with cute/peachy tones)
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightPrimary = Color(0xFFEF476F); // Watermelon red
  static const Color lightAccent = Color(0xFFFFC6A8); // Creamy peach
  static const Color lightText = Color(0xFF212121);
  static const List<Color> lightGradient = [
    Color(0xFFFFE4E1),
    Color(0xFFFFB6B9),
    Color(0xFFFF9AA2),
  ];

  // 🌑 Dark Theme (improved with teal/purple combo)
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkPrimary = Color(0xFF00C2CB); // Bright teal
  static const Color darkAccent = Color(0xFF9F7AEA); // Soft purple
  static const Color darkText = Color(0xFFE0E0E0);
  static const List<Color> darkGradient = [
    Color(0xFF1A1A2E),
    Color(0xFF16213E),
    Color(0xFF0F3460),
  ];
}
