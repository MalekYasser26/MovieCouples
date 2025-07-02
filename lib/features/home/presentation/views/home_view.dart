import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_couples_tracker/core/utils/app_themes_extension.dart';
import 'package:movies_couples_tracker/core/widgets/view_models/theme_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedTheme = 'spring';

  final themes = {
    'spring': 'Spring Love',
    'autumn': 'Autumn Vibes',
    'sunset': 'Sunset Glow',
    'sunrise': 'Sunrise Blush',
    'cute': 'Cutesy Pink',
  };

  @override
  Widget build(BuildContext context) {
    final themeExt = Theme.of(context).extension<AppThemeExtension>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Couples Movie Tracker'),
        backgroundColor: themeExt.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Theme:',
              style: TextStyle(
                fontSize: 18,
                color: themeExt.text,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButton<String>(
              value: selectedTheme,
              items: themes.entries
                  .map(
                    (e) => DropdownMenuItem(
                  value: e.key,
                  child: Text(e.value),
                ),
              )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedTheme = value);
                  context.read<ThemeCubit>().setTheme(value);
                }
              },
            ),
            const SizedBox(height: 40),
            // Example UI showing usage of theme colors
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: themeExt.gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                'Welcome to your couples movie tracker!',
                style: TextStyle(
                  color: themeExt.text,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
