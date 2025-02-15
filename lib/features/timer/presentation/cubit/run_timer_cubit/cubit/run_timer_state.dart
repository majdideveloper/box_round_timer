part of 'run_timer_cubit.dart';

@freezed
class RunTimerState with _$RunTimerState {
  const factory RunTimerState({
    required TimerEntity timer,
    required TimerStatus status,
    required int remainingTime,
    required int currentRound,
    @Default(true) bool isFirstPhase, // Only for dualPhase timers
  }) = _RunTimerState;
}

enum TimerStatus { initial, running, paused, finished }
