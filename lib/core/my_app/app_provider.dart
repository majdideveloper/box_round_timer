import 'package:box_round_timer/core/cubit/language_cubit.dart';
import 'package:box_round_timer/core/cubit/theme_cubit.dart';
import 'package:box_round_timer/core/cubit/version_cubit.dart';
import 'package:box_round_timer/core/my_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
        BlocProvider(create: (_) => VersionCubit()),
      ],
      child: MyApp(),
    );
  }
}
