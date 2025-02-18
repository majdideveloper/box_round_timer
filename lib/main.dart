import 'package:box_round_timer/features/timer/presentation/cubit/timer_cubit/timer_cubit.dart';
import 'package:box_round_timer/features/timer/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/my_app/app_provider.dart';
import 'main_injection_container.dart' as di;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await di.init();
//   runApp(const MyApp());
// }

//! new part
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // bool isShowOnboarding = await getOnboardingStatus();

  runApp(AppProvider());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<TimerCubit>()..fetchTimers(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
