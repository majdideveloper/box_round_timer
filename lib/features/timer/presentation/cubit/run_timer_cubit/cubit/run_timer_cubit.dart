import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/timer_entity.dart';

part 'run_timer_state.dart';
part 'run_timer_cubit.freezed.dart';

class RunTimerCubit extends Cubit<RunTimerState> {
  Timer? _timer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  RunTimerCubit(TimerEntity timer)
      : super(RunTimerState(
          timer: timer,
          status: TimerStatus.initial,
          remainingTime: timer.preparationTime,
          currentRound: 1,
          isPreparation: true,
          isFirstPhase: false,
        ));

  void startTimer() {
    if (state.status == TimerStatus.running) return;

    emit(state.copyWith(status: TimerStatus.running));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingTime > 0) {
        emit(state.copyWith(remainingTime: state.remainingTime - 1));
        if (state.timer.type == TypeTimer.dualPhase &&
            state.isFirstPhase &&
            state.timer.firstPhaseDuration != null &&
            state.remainingTime == state.timer.secondPhaseDuration) {
          emit(state.copyWith(
            isFirstPhase: false,
          ));
          // _playSound();
        }
      } else {
        if (state.isPreparation) {
          _startRound();
          // _playSound();
        } else if (state.isResting) {
          _startRound();
          // _playSound();
        } else {
          _handleRoundCompletion();
          // _playSound();
        }
      }
    });
  }

  void _startRound() {
    emit(state.copyWith(
      isPreparation: false,
      isResting: false,
      remainingTime: state.timer.roundTime ?? 0,
      isFirstPhase: state.timer.type ==
          TypeTimer.dualPhase, // Set isFirstPhase based on timer type
    ));
  }

  void _handleRoundCompletion() {
    if (state.timer.type == TypeTimer.dualPhase) {
      if (state.isFirstPhase &&
          state.timer.firstPhaseDuration != null &&
          state.remainingTime == state.timer.firstPhaseDuration) {
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
        isFirstPhase: false, // Set isFirstPhase based on timer type
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
      isFirstPhase: state.timer.type ==
          TypeTimer.dualPhase, // Set isFirstPhase based on timer type
    ));
  }

  // Play sound function
  void _playSound() async {
    try {
      await _audioPlayer
          .play(AssetSource('audio/boxing_test.mp3')); // Play sound from assets
    } catch (e) {
      log("Error playing sound: $e");
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
