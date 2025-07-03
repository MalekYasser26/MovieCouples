import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color background;
  final Color primary;
  final Color accent;
  final Color text;
  final List<Color> gradient;

  const AppThemeExtension({
    required this.background,
    required this.primary,
    required this.accent,
    required this.text,
    required this.gradient,
  });

  @override
  AppThemeExtension copyWith({
    Color? background,
    Color? primary,
    Color? accent,
    Color? text,
    List<Color>? gradient,
  }) {
    return AppThemeExtension(
      background: background ?? this.background,
      primary: primary ?? this.primary,
      accent: accent ?? this.accent,
      text: text ?? this.text,
      gradient: gradient ?? this.gradient,
    );
  }

  @override
  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;

    final minLength = gradient.length < other.gradient.length
        ? gradient.length
        : other.gradient.length;

    return AppThemeExtension(
      background: Color.lerp(background, other.background, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      text: Color.lerp(text, other.text, t)!,
      gradient: List<Color>.generate(
        minLength,
            (i) => Color.lerp(gradient[i], other.gradient[i], t)!,
      ),
    );
  }
}
