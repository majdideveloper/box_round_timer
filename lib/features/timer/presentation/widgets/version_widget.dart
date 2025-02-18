import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/cubit/version_cubit.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VersionCubit, VersionState>(
      builder: (context, state) {
        String version = "Loading...";
        if (state is VersionLoaded) {
          version = state.version;
        } else if (state is VersionError) {
          version = "Version not available";
        }
        return Text(
          "${AppLocalizations.of(context)!.version}: $version ",
          style: Theme.of(context).textTheme.labelSmall,
        );
      },
    );
  }
}
