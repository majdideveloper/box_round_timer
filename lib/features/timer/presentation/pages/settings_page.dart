import 'package:box_round_timer/features/timer/presentation/widgets/theme_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/cubit/version_cubit.dart';
import '../widgets/language_dropdown.dart';
import '../widgets/version_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VersionCubit()..loadVersion(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ThemeToggleButton(),
              const LanguageDropdown(),
              const Spacer(), // Pushes the button to the bottom
              const VersionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
