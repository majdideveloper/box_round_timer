part of 'run_timer_cubit.dart';

@freezed
class RunTimerState with _$RunTimerState {
  const factory RunTimerState({
    required TimerEntity timer,
    required TimerStatus status,
    required int remainingTime,
    required int currentRound,
    @Default(true) bool isFirstPhase,
    @Default(true) bool isPreparation,
    @Default(false) bool isResting,
  }) = _RunTimerState;
}

enum TimerStatus { initial, running, resting, paused, finished }
