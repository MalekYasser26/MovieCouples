import 'package:flutter/material.dart';
import 'package:movies_couples_tracker/core/utils/app_themes_extension.dart';
import 'package:movies_couples_tracker/core/utils/app_text_theme.dart';
import 'package:movies_couples_tracker/features/casting/features/presnetation/views/widgets/split_heart_painter.dart';

class CastingView extends StatelessWidget {
  const CastingView({super.key});

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
            Spacer(),
            SplitHeartWidget(isLeftFilled: true, isRightFilled: false),

            const SizedBox(height: 16),
            Text(
              "Waiting for your lovebird ...",
              style: AppTextStyles.titleMedium(themeExt.text),
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
                    child: const Icon(Icons.person, color: Colors.white, size: 32),
                  ),
                  const SizedBox(height: 12),
                  Text("You", style: AppTextStyles.titleMedium(Colors.black)),
                  const SizedBox(height: 8),
                  SelectableText(
                    "Invite Code: M0V1E-4LUV",
                    style: AppTextStyles.bodyMedium(Colors.black87),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon:  Icon(Icons.copy,color: themeExt.accent,),
                  label: const Text("Copy Code"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeExt.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text("Share"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeExt.accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),

            const Spacer(),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Back", style: AppTextStyles.labelLarge(themeExt.text)),
            ),
          ],
        ),
      ),
    );
  }
}
