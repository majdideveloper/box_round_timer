import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/cubit/language_cubit.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.read<LanguageCubit>();

    return ListTile(
      title: Text(AppLocalizations.of(context)!.selectLanguageOfYourChoice),
      trailing: DropdownButton<Locale>(
        value: context.watch<LanguageCubit>().state,
        items: AppConstants.supportedLanguages.entries.map((entry) {
          return DropdownMenuItem(
            value: Locale(entry.key),
            child: Text(entry.value),
          );
        }).toList(),
        onChanged: (Locale? locale) {
          if (locale != null) {
            languageCubit.changeLanguage(locale);
          }
        },
      ),
    );
  }
}
