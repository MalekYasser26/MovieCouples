import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_couples_tracker/core/utils/app_animations.dart';
import 'package:movies_couples_tracker/core/utils/app_themes_extension.dart';
import 'package:movies_couples_tracker/features/on_boarding_view/presentation/views/on_boarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {
  String selectedTheme = 'spring';

  final Map<String, String> themeToAnimation = {
    'cute': AppAnimations.cutesyPinkSplash,
    'spring': AppAnimations.springLoveSplash,
    'autumn': AppAnimations.autumnVibesSplash,
    'sunset': AppAnimations.sunsetGlowSplash,
    'sunrise': AppAnimations.sunriseBlushSplash,
  };

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const OnBoardingView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Fade transition example
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final animationPath = themeToAnimation[selectedTheme] ?? AppAnimations.cutesyPinkSplash;
    final themeExt = Theme.of(context).extension<AppThemeExtension>()!;
    return Scaffold(
      body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(colors: themeExt.gradient)
    ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  animationPath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
