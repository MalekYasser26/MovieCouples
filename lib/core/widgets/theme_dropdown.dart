import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_couples_tracker/core/utils/app_themes.dart';
import 'package:movies_couples_tracker/core/utils/app_themes_extension.dart';
import 'package:movies_couples_tracker/core/widgets/view_models/theme_cubit.dart';

class ThemeDropdown extends StatefulWidget {
  const ThemeDropdown({super.key});

  @override
  State<ThemeDropdown> createState() => _ThemeDropdownState();
}

class _ThemeDropdownState extends State<ThemeDropdown> {
  late String selectedTheme;

  final Map<String, String> themes = {
    'spring': 'Spring Love',
    'autumn': 'Autumn Vibes',
    'sunset': 'Sunset Glow',
    'sunrise': 'Sunrise Blush',
    'cute': 'Cutesy Pink',
  };

  @override
  void initState() {
    super.initState();
    selectedTheme = 'spring'; // you can load from cache later
  }

  @override
  Widget build(BuildContext context) {
    final themeExt = Theme.of(context).extension<AppThemeExtension>()!;

    final selectedThemeName = themes[selectedTheme] ?? 'Select Theme';
    final selectedThemeExtension = AppTheme.getExtensionByName(selectedTheme);
    final selectedColor = selectedThemeExtension?.primary ?? themeExt.primary;

    return PopupMenuButton<String>(
      onSelected: (value) {
        setState(() {
          selectedTheme = value;
        });
        context.read<ThemeCubit>().setTheme(value);
      },
      color: themeExt.background,
      itemBuilder: (context) {
        return themes.entries.map((entry) {
          final themeExtItem = AppTheme.getExtensionByName(entry.key);
          final color = themeExtItem?.primary ?? themeExt.primary;
          return PopupMenuItem<String>(
            value: entry.key,
            child: Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  entry.value,
                  style: TextStyle(color: themeExt.text),
                ),
              ],
            ),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: selectedColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: selectedColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: selectedColor.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: selectedColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              selectedThemeName,
              style: TextStyle(
                color: themeExt.text,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: themeExt.text,
            ),
          ],
        ),
      ),
    );
  }
}
