import 'package:flutter/material.dart';
import 'package:movies_couples_tracker/core/utils/app_images.dart';
import 'package:movies_couples_tracker/core/utils/app_text_theme.dart';
import 'package:movies_couples_tracker/core/utils/app_themes_extension.dart';
import 'package:movies_couples_tracker/features/casting/features/presnetation/views/accepting_view.dart';
import 'package:movies_couples_tracker/features/casting/features/presnetation/views/casting_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeExt = Theme.of(context).extension<AppThemeExtension>()!;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: themeExt.gradient)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                SizedBox(
                  height: size.height * 0.25,
                  child: Image.asset(
                    AppImages.appLogo,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 32),

                Text(
                  'Welcome to Movie Mates',
                  style: AppTextStyles.headlineLarge(themeExt.text),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Track your shared watchlists with your partner',
                  style: AppTextStyles.bodyLarge(themeExt.text),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                _buildButton(
                  context: context,
                  label: 'Cast Your Co-Star',
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const CastingView(),
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
                  color: themeExt.primary.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 20),

                // Join Invite Button
                _buildButton(
                  context: context,
                  label: 'Answer the Call',
                  onPressed: () {
                    Navigator.of(context).push(
                        PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const AcceptingView(),
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
                  color: themeExt.accent.withValues(alpha: 0.3),
                ),
                Spacer(),
                // Continue as Single
                TextButton(
                  onPressed: () {
                    // TODO: Continue to app as single user
                  },
                  child: Text(
                    'Pssssssssssssssssssssssssss : If you\'re single you could still use the app . Just click here' ,
                    style: AppTextStyles.bodyLarge(themeExt.text),
                    textAlign: TextAlign.center,

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          // style: TextStyle(
          //   color: Theme.of(context).brightness == Brightness.dark
          //       ? Colors.black
          //       : Colors.white,
          //   fontSize: 16,
          //   fontWeight: FontWeight.w600,
          // ),
          style: AppTextStyles.titleLarge(
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.white),
        ),
      ),
    );
  }
}
