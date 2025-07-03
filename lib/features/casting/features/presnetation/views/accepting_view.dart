import 'package:flutter/material.dart';
import 'package:movies_couples_tracker/core/utils/app_themes_extension.dart';
import 'package:movies_couples_tracker/core/utils/app_text_theme.dart';
import 'package:movies_couples_tracker/features/casting/features/presnetation/views/widgets/split_heart_painter.dart';
import 'package:movies_couples_tracker/features/home/presentation/views/home_view.dart';

class AcceptingView extends StatefulWidget {
  const AcceptingView({super.key});

  @override
  State<AcceptingView> createState() => _AcceptingViewState();
}

class _AcceptingViewState extends State<AcceptingView> {
  bool isRightFilled = false;

  @override
  Widget build(BuildContext context) {
    final themeExt = Theme.of(context).extension<AppThemeExtension>()!;

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: themeExt.gradient),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // Heart reflects current state
            SplitHeartWidget(isLeftFilled: true, isRightFilled: isRightFilled),

            const SizedBox(height: 16),
            Text(
              isRightFilled
                  ? "Your love story begins!"
                  : "Is the popcorn ready?",
              style: AppTextStyles.titleMedium(themeExt.text),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: themeExt.primary,
                    child: const Icon(Icons.person_outline,
                        color: Colors.white, size: 32),
                  ),
                  const SizedBox(height: 12),
                  Text("Your Partner",
                      style: AppTextStyles.titleMedium(Colors.black)),
                  const SizedBox(height: 8),
                  SelectableText(
                    "Invite Code: M0V1E-4LUV",
                    style: AppTextStyles.bodyMedium(Colors.black87),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            IconButton(
              onPressed: () {
                setState(() {
                  isRightFilled = true;
                });

                Future.delayed(const Duration(seconds: 3), () {
                  if (!mounted) return;
                  if (context.mounted) {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 800),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const HomeView(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  }
                });
              },
              icon: const Icon(Icons.fingerprint, size: 50),
              style: IconButton.styleFrom(
                backgroundColor: themeExt.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(20),
                shape: const CircleBorder(),
              ),
            ),

            const Spacer(),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  Text("Back", style: AppTextStyles.labelLarge(themeExt.text)),
            ),
          ],
        ),
      ),
    );
  }
}
