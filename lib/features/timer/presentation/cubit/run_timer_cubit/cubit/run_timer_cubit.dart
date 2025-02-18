import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/timer_entity.dart';

part 'run_timer_state.dart';
part 'run_timer_cubit.freezed.dart';

class RunTimerCubit extends Cubit<RunTimerState> {
  Timer? _timer;

  RunTimerCubit(TimerEntity timer)
      : super(RunTimerState(
          timer: timer,
          status: TimerStatus.initial,
          remainingTime: timer.preparationTime,
          currentRound: 1,
          isPreparation: true,
        ));

  void startTimer() {
    if (state.status == TimerStatus.running) return;

    emit(state.copyWith(status: TimerStatus.running));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingTime > 0) {
        emit(state.copyWith(remainingTime: state.remainingTime - 1));
      } else {
        if (state.isPreparation) {
          _startRound();
        } else if (state.isResting) {
          _startRound();
        } else {
          _handleRoundCompletion();
        }
      }
    });
  }

  void _startRound() {
    emit(state.copyWith(
      isPreparation: false,
      isResting: false,
      remainingTime: state.timer.roundTime ?? 0,
    ));
  }

  void _handleRoundCompletion() {
    if (state.timer.type == TypeTimer.dualPhase) {
      if (state.isFirstPhase &&
          state.timer.firstPhaseDuration != null &&
          state.remainingTime == state.timer.secondPhaseDuration) {
        emit(state.copyWith(
          isFirstPhase: false,
        ));
      } else {
        _nextRound();
      }
    } else {
      _nextRound();
    }
  }

  void _nextRound() {
    if (state.currentRound < state.timer.numberOfRounds) {
      emit(state.copyWith(
        remainingTime: state.timer.resetTime,
        currentRound: state.currentRound + 1,
        isFirstPhase: true, // Reset for dualPhase
        isResting: true,
      ));
    } else {
      _finishTimer();
    }
  }

  void _finishTimer() {
    _timer?.cancel();
    emit(state.copyWith(status: TimerStatus.finished));
  }

  void pauseTimer() {
    _timer?.cancel();
    emit(state.copyWith(status: TimerStatus.paused));
  }

  void resetTimer() {
    _timer?.cancel();
    emit(RunTimerState(
      timer: state.timer,
      status: TimerStatus.initial,
      remainingTime: state.timer.preparationTime,
      currentRound: 1,
      isPreparation: true,
    ));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
