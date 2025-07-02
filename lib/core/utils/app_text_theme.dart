import 'package:flutter/material.dart';

abstract class AppTextStyles {
  // Helper to get PlayfairDisplay font with color
  static TextStyle _base(double size, FontWeight weight, Color color, {double height = 1.1}) {
    return TextStyle(
      fontFamily: 'PlayfairDisplay',
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
    );
  }

  static TextStyle displayLarge(Color color) =>
      _base(57, FontWeight.bold, color, height: 1.1);

  static TextStyle displayMedium(Color color) =>
      _base(45, FontWeight.bold, color, height: 1.1);

  static TextStyle displaySmall(Color color) =>
      _base(36, FontWeight.w600, color, height: 1.1);

  static TextStyle headlineLarge(Color color) =>
      _base(32, FontWeight.w700, color, height: 1.1);

  static TextStyle headlineMedium(Color color) =>
      _base(28, FontWeight.w600, color, height: 1.1);

  static TextStyle headlineSmall(Color color) =>
      _base(24, FontWeight.w600, color, height: 1.1);

  static TextStyle titleLarge(Color color) =>
      _base(22, FontWeight.w600, color, height: 1.2);

  static TextStyle titleMedium(Color color) =>
      _base(18, FontWeight.w500, color, height: 1.2);

  static TextStyle titleSmall(Color color) =>
      _base(14, FontWeight.w500, color, height: 1.2);

  static TextStyle bodyLarge(Color color) =>
      _base(16, FontWeight.normal, color, height: 1.3);

  static TextStyle bodyMedium(Color color) =>
      _base(14, FontWeight.normal, color, height: 1.3);

  static TextStyle bodySmall(Color color) =>
      _base(12, FontWeight.normal, color, height: 1.3);

  static TextStyle labelLarge(Color color) =>
      _base(14, FontWeight.w600, color, height: 1.2);

  static TextStyle labelSmall(Color color) =>
      _base(12, FontWeight.w600, color, height: 1.2);

  // Optional: convenience methods that take BuildContext and read color from theme:
  static TextStyle displayLargeOf(BuildContext context) =>
      displayLarge(Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black);

  static TextStyle headlineLargeOf(BuildContext context) =>
      headlineLarge(Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black);

// Add more as needed...
}
