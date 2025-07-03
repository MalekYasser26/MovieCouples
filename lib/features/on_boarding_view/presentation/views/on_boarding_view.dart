import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_couples_tracker/core/utils/app_animations.dart';
import 'package:movies_couples_tracker/core/utils/app_text_theme.dart';
import 'package:movies_couples_tracker/core/utils/app_themes_extension.dart';
import 'package:movies_couples_tracker/core/widgets/theme_dropdown.dart';
import 'package:movies_couples_tracker/features/on_boarding_view/presentation/views/welcome_view.dart';


class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeExt = Theme.of(context).extension<AppThemeExtension>()!;
    final size = MediaQuery.of(context).size;
    final lineY = size.height * 1 / 3;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: themeExt.gradient)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SizedBox(
              height: lineY,
              child: Lottie.asset(
                AppAnimations.onBoarding,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'One app, two hearts keep your movie nights perfectly aligned.',
                textAlign: TextAlign.center,
                style: AppTextStyles.headlineLarge(themeExt.text),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const WelcomeView(),
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
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: themeExt.primary,
              ),
              child: Text(
                'Start Now',
                style: AppTextStyles.titleLarge(Colors.white),
              ),
            ),
            ThemeDropdown(),
            Spacer(),


          ],
        )

      ),
    );
  }
}
