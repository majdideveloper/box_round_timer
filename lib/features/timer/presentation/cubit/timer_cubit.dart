import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:box_round_timer/features/timer/data/models/timer_model.dart';
import 'package:box_round_timer/features/timer/domain/entities/timer_entity.dart';
import 'package:box_round_timer/features/timer/domain/usecases/add_timer_usecaase.dart';
import 'package:box_round_timer/features/timer/domain/usecases/get_all_timers_usecase.dart';
import 'package:box_round_timer/features/timer/domain/usecases/remove_timer_usecase.dart';
import 'package:box_round_timer/features/timer/domain/usecases/update_tiemr_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.dart';
part 'timer_cubit.freezed.dart';

class TimerCubit extends Cubit<TimerState> {
  final GetAllTimersUsecase getTimers;
  final AddTimerUsecase addTimer;
  final UpdateTimerUsecase updateTimer;
  final RemoveTimerUsecase removeTimer;

  TimerCubit({
    required this.getTimers,
    required this.addTimer,
    required this.updateTimer,
    required this.removeTimer,
  }) : super(const TimerState.initial());

  Future<void> fetchTimers() async {
    emit(const TimerState.loading());
    final failureOrTimers = await getTimers();
    failureOrTimers.fold((failure) {
      log(failure.message);
    }, (timers) {
      emit(TimerState.loaded(timers));
    });
  }

  Future<void> createTimer(TimerEntity timer) async {
    await addTimer(timer);
    fetchTimers();
  }

  Future<void> editTimer(String id, TimerEntity timer) async {
    await updateTimer(id, timer);
    fetchTimers();
  }

  Future<void> deleteTimer(String idTimer) async {
    await removeTimer(idTimer);
    fetchTimers();
  }
}
