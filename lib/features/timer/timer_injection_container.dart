import 'package:box_round_timer/features/timer/data/datasources/local_data_source/timer_local_data_source.dart';
import 'package:box_round_timer/features/timer/data/repositories/timer_repository_impl.dart';
import 'package:box_round_timer/features/timer/domain/repositories/timer_repository.dart';
import 'package:box_round_timer/features/timer/domain/usecases/add_timer_usecaase.dart';
import 'package:box_round_timer/features/timer/domain/usecases/get_all_timers_usecase.dart';
import 'package:box_round_timer/features/timer/domain/usecases/remove_timer_usecase.dart';
import 'package:box_round_timer/features/timer/domain/usecases/update_tiemr_usecase.dart';

import 'package:box_round_timer/features/timer/presentation/cubit/timer_cubit.dart';

import '../../main_injection_container.dart';

Future<void> tiemrInjectionContainer() async {
  // * CUBITS INJECTION
  sl.registerFactory<TimerCubit>(() => TimerCubit(
        getTimers: sl(),
        addTimer: sl(),
        updateTimer: sl(),
        removeTimer: sl(),
      ));

  // * USE CASES INJECTION
  sl.registerLazySingleton<GetAllTimersUsecase>(
      () => GetAllTimersUsecase(sl()));
  sl.registerLazySingleton<AddTimerUsecase>(() => AddTimerUsecase(sl()));
  sl.registerLazySingleton<UpdateTimerUsecase>(() => UpdateTimerUsecase(sl()));
  sl.registerLazySingleton<RemoveTimerUsecase>(() => RemoveTimerUsecase(sl()));

  // * REPOSITORY INJECTION
  sl.registerLazySingleton<TimerRepository>(
      () => TimerRepositoryImpl(localDataSource: sl()));

  // DATA SOURCES INJECTION
  sl.registerLazySingleton<TimerLocalDataSource>(
      () => TimerLocalDataSourceImpl(sharedPreferences: sl()));
}
