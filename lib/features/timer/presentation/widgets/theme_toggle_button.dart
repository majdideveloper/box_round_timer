import 'package:box_round_timer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/cubit/theme_cubit.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        // Define if the theme is dark mode or not.
        bool isDarkMode = themeMode == ThemeMode.dark;

        return ListTile(
          title: Text(AppLocalizations.of(context)!.changeTheme),
          trailing: Switch(
            value: isDarkMode, // Set value based on theme mode
            activeColor: AppColors.primaryColor,
            inactiveThumbColor: AppColors.grey,
            inactiveTrackColor: AppColors.grey.withOpacity(0.4),
            activeTrackColor: AppColors.primaryColor.withOpacity(0.4),
            onChanged: (bool newValue) {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        );
      },
    );
  }
}
