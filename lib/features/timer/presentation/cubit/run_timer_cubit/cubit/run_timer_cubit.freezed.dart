// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run_timer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RunTimerState {
  TimerEntity get timer => throw _privateConstructorUsedError;
  TimerStatus get status => throw _privateConstructorUsedError;
  int get remainingTime => throw _privateConstructorUsedError;
  int get currentRound => throw _privateConstructorUsedError;
  bool get isFirstPhase => throw _privateConstructorUsedError;
  bool get isPreparation => throw _privateConstructorUsedError;
  bool get isResting => throw _privateConstructorUsedError;

  /// Create a copy of RunTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RunTimerStateCopyWith<RunTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunTimerStateCopyWith<$Res> {
  factory $RunTimerStateCopyWith(
          RunTimerState value, $Res Function(RunTimerState) then) =
      _$RunTimerStateCopyWithImpl<$Res, RunTimerState>;
  @useResult
  $Res call(
      {TimerEntity timer,
      TimerStatus status,
      int remainingTime,
      int currentRound,
      bool isFirstPhase,
      bool isPreparation,
      bool isResting});
}

/// @nodoc
class _$RunTimerStateCopyWithImpl<$Res, $Val extends RunTimerState>
    implements $RunTimerStateCopyWith<$Res> {
  _$RunTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timer = null,
    Object? status = null,
    Object? remainingTime = null,
    Object? currentRound = null,
    Object? isFirstPhase = null,
    Object? isPreparation = null,
    Object? isResting = null,
  }) {
    return _then(_value.copyWith(
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as TimerEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      isFirstPhase: null == isFirstPhase
          ? _value.isFirstPhase
          : isFirstPhase // ignore: cast_nullable_to_non_nullable
              as bool,
      isPreparation: null == isPreparation
          ? _value.isPreparation
          : isPreparation // ignore: cast_nullable_to_non_nullable
              as bool,
      isResting: null == isResting
          ? _value.isResting
          : isResting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RunTimerStateImplCopyWith<$Res>
    implements $RunTimerStateCopyWith<$Res> {
  factory _$$RunTimerStateImplCopyWith(
          _$RunTimerStateImpl value, $Res Function(_$RunTimerStateImpl) then) =
      __$$RunTimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TimerEntity timer,
      TimerStatus status,
      int remainingTime,
      int currentRound,
      bool isFirstPhase,
      bool isPreparation,
      bool isResting});
}

/// @nodoc
class __$$RunTimerStateImplCopyWithImpl<$Res>
    extends _$RunTimerStateCopyWithImpl<$Res, _$RunTimerStateImpl>
    implements _$$RunTimerStateImplCopyWith<$Res> {
  __$$RunTimerStateImplCopyWithImpl(
      _$RunTimerStateImpl _value, $Res Function(_$RunTimerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RunTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timer = null,
    Object? status = null,
    Object? remainingTime = null,
    Object? currentRound = null,
    Object? isFirstPhase = null,
    Object? isPreparation = null,
    Object? isResting = null,
  }) {
    return _then(_$RunTimerStateImpl(
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as TimerEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as int,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      isFirstPhase: null == isFirstPhase
          ? _value.isFirstPhase
          : isFirstPhase // ignore: cast_nullable_to_non_nullable
              as bool,
      isPreparation: null == isPreparation
          ? _value.isPreparation
          : isPreparation // ignore: cast_nullable_to_non_nullable
              as bool,
      isResting: null == isResting
          ? _value.isResting
          : isResting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RunTimerStateImpl implements _RunTimerState {
  const _$RunTimerStateImpl(
      {required this.timer,
      required this.status,
      required this.remainingTime,
      required this.currentRound,
      this.isFirstPhase = true,
      this.isPreparation = true,
      this.isResting = false});

  @override
  final TimerEntity timer;
  @override
  final TimerStatus status;
  @override
  final int remainingTime;
  @override
  final int currentRound;
  @override
  @JsonKey()
  final bool isFirstPhase;
  @override
  @JsonKey()
  final bool isPreparation;
  @override
  @JsonKey()
  final bool isResting;

  @override
  String toString() {
    return 'RunTimerState(timer: $timer, status: $status, remainingTime: $remainingTime, currentRound: $currentRound, isFirstPhase: $isFirstPhase, isPreparation: $isPreparation, isResting: $isResting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunTimerStateImpl &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.currentRound, currentRound) ||
                other.currentRound == currentRound) &&
            (identical(other.isFirstPhase, isFirstPhase) ||
                other.isFirstPhase == isFirstPhase) &&
            (identical(other.isPreparation, isPreparation) ||
                other.isPreparation == isPreparation) &&
            (identical(other.isResting, isResting) ||
                other.isResting == isResting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timer, status, remainingTime,
      currentRound, isFirstPhase, isPreparation, isResting);

  /// Create a copy of RunTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunTimerStateImplCopyWith<_$RunTimerStateImpl> get copyWith =>
      __$$RunTimerStateImplCopyWithImpl<_$RunTimerStateImpl>(this, _$identity);
}

abstract class _RunTimerState implements RunTimerState {
  const factory _RunTimerState(
      {required final TimerEntity timer,
      required final TimerStatus status,
      required final int remainingTime,
      required final int currentRound,
      final bool isFirstPhase,
      final bool isPreparation,
      final bool isResting}) = _$RunTimerStateImpl;

  @override
  TimerEntity get timer;
  @override
  TimerStatus get status;
  @override
  int get remainingTime;
  @override
  int get currentRound;
  @override
  bool get isFirstPhase;
  @override
  bool get isPreparation;
  @override
  bool get isResting;

  /// Create a copy of RunTimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunTimerStateImplCopyWith<_$RunTimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
