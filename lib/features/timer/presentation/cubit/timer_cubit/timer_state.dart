part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState.initial() = _Initial;
  const factory TimerState.loading() = _Loading;
  const factory TimerState.loaded(List<TimerEntity> timers) = _Loaded;
}
