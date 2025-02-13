// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerModel _$TimerModelFromJson(Map<String, dynamic> json) {
  return _TimerModel.fromJson(json);
}

/// @nodoc
mixin _$TimerModel {
  String get nameOfTimer =>
      throw _privateConstructorUsedError; // Added nameOfTimer
  String get idTimer => throw _privateConstructorUsedError; // Added idTimer
  int get preparationTime => throw _privateConstructorUsedError;
  int? get roundTime => throw _privateConstructorUsedError;
  int get resetTime => throw _privateConstructorUsedError;
  TypeTimer get type =>
      throw _privateConstructorUsedError; // Use TypeTimer enum instead of String
  int get numberOfRounds => throw _privateConstructorUsedError;
  int? get firstPhaseDuration => throw _privateConstructorUsedError;
  int? get secondPhaseDuration => throw _privateConstructorUsedError;

  /// Serializes this TimerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerModelCopyWith<TimerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerModelCopyWith<$Res> {
  factory $TimerModelCopyWith(
          TimerModel value, $Res Function(TimerModel) then) =
      _$TimerModelCopyWithImpl<$Res, TimerModel>;
  @useResult
  $Res call(
      {String nameOfTimer,
      String idTimer,
      int preparationTime,
      int? roundTime,
      int resetTime,
      TypeTimer type,
      int numberOfRounds,
      int? firstPhaseDuration,
      int? secondPhaseDuration});
}

/// @nodoc
class _$TimerModelCopyWithImpl<$Res, $Val extends TimerModel>
    implements $TimerModelCopyWith<$Res> {
  _$TimerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameOfTimer = null,
    Object? idTimer = null,
    Object? preparationTime = null,
    Object? roundTime = freezed,
    Object? resetTime = null,
    Object? type = null,
    Object? numberOfRounds = null,
    Object? firstPhaseDuration = freezed,
    Object? secondPhaseDuration = freezed,
  }) {
    return _then(_value.copyWith(
      nameOfTimer: null == nameOfTimer
          ? _value.nameOfTimer
          : nameOfTimer // ignore: cast_nullable_to_non_nullable
              as String,
      idTimer: null == idTimer
          ? _value.idTimer
          : idTimer // ignore: cast_nullable_to_non_nullable
              as String,
      preparationTime: null == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      roundTime: freezed == roundTime
          ? _value.roundTime
          : roundTime // ignore: cast_nullable_to_non_nullable
              as int?,
      resetTime: null == resetTime
          ? _value.resetTime
          : resetTime // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeTimer,
      numberOfRounds: null == numberOfRounds
          ? _value.numberOfRounds
          : numberOfRounds // ignore: cast_nullable_to_non_nullable
              as int,
      firstPhaseDuration: freezed == firstPhaseDuration
          ? _value.firstPhaseDuration
          : firstPhaseDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      secondPhaseDuration: freezed == secondPhaseDuration
          ? _value.secondPhaseDuration
          : secondPhaseDuration // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerModelImplCopyWith<$Res>
    implements $TimerModelCopyWith<$Res> {
  factory _$$TimerModelImplCopyWith(
          _$TimerModelImpl value, $Res Function(_$TimerModelImpl) then) =
      __$$TimerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nameOfTimer,
      String idTimer,
      int preparationTime,
      int? roundTime,
      int resetTime,
      TypeTimer type,
      int numberOfRounds,
      int? firstPhaseDuration,
      int? secondPhaseDuration});
}

/// @nodoc
class __$$TimerModelImplCopyWithImpl<$Res>
    extends _$TimerModelCopyWithImpl<$Res, _$TimerModelImpl>
    implements _$$TimerModelImplCopyWith<$Res> {
  __$$TimerModelImplCopyWithImpl(
      _$TimerModelImpl _value, $Res Function(_$TimerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameOfTimer = null,
    Object? idTimer = null,
    Object? preparationTime = null,
    Object? roundTime = freezed,
    Object? resetTime = null,
    Object? type = null,
    Object? numberOfRounds = null,
    Object? firstPhaseDuration = freezed,
    Object? secondPhaseDuration = freezed,
  }) {
    return _then(_$TimerModelImpl(
      nameOfTimer: null == nameOfTimer
          ? _value.nameOfTimer
          : nameOfTimer // ignore: cast_nullable_to_non_nullable
              as String,
      idTimer: null == idTimer
          ? _value.idTimer
          : idTimer // ignore: cast_nullable_to_non_nullable
              as String,
      preparationTime: null == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int,
      roundTime: freezed == roundTime
          ? _value.roundTime
          : roundTime // ignore: cast_nullable_to_non_nullable
              as int?,
      resetTime: null == resetTime
          ? _value.resetTime
          : resetTime // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeTimer,
      numberOfRounds: null == numberOfRounds
          ? _value.numberOfRounds
          : numberOfRounds // ignore: cast_nullable_to_non_nullable
              as int,
      firstPhaseDuration: freezed == firstPhaseDuration
          ? _value.firstPhaseDuration
          : firstPhaseDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      secondPhaseDuration: freezed == secondPhaseDuration
          ? _value.secondPhaseDuration
          : secondPhaseDuration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerModelImpl implements _TimerModel {
  const _$TimerModelImpl(
      {required this.nameOfTimer,
      required this.idTimer,
      required this.preparationTime,
      required this.roundTime,
      required this.resetTime,
      required this.type,
      required this.numberOfRounds,
      required this.firstPhaseDuration,
      required this.secondPhaseDuration});

  factory _$TimerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerModelImplFromJson(json);

  @override
  final String nameOfTimer;
// Added nameOfTimer
  @override
  final String idTimer;
// Added idTimer
  @override
  final int preparationTime;
  @override
  final int? roundTime;
  @override
  final int resetTime;
  @override
  final TypeTimer type;
// Use TypeTimer enum instead of String
  @override
  final int numberOfRounds;
  @override
  final int? firstPhaseDuration;
  @override
  final int? secondPhaseDuration;

  @override
  String toString() {
    return 'TimerModel(nameOfTimer: $nameOfTimer, idTimer: $idTimer, preparationTime: $preparationTime, roundTime: $roundTime, resetTime: $resetTime, type: $type, numberOfRounds: $numberOfRounds, firstPhaseDuration: $firstPhaseDuration, secondPhaseDuration: $secondPhaseDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerModelImpl &&
            (identical(other.nameOfTimer, nameOfTimer) ||
                other.nameOfTimer == nameOfTimer) &&
            (identical(other.idTimer, idTimer) || other.idTimer == idTimer) &&
            (identical(other.preparationTime, preparationTime) ||
                other.preparationTime == preparationTime) &&
            (identical(other.roundTime, roundTime) ||
                other.roundTime == roundTime) &&
            (identical(other.resetTime, resetTime) ||
                other.resetTime == resetTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.numberOfRounds, numberOfRounds) ||
                other.numberOfRounds == numberOfRounds) &&
            (identical(other.firstPhaseDuration, firstPhaseDuration) ||
                other.firstPhaseDuration == firstPhaseDuration) &&
            (identical(other.secondPhaseDuration, secondPhaseDuration) ||
                other.secondPhaseDuration == secondPhaseDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nameOfTimer,
      idTimer,
      preparationTime,
      roundTime,
      resetTime,
      type,
      numberOfRounds,
      firstPhaseDuration,
      secondPhaseDuration);

  /// Create a copy of TimerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerModelImplCopyWith<_$TimerModelImpl> get copyWith =>
      __$$TimerModelImplCopyWithImpl<_$TimerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerModelImplToJson(
      this,
    );
  }
}

abstract class _TimerModel implements TimerModel {
  const factory _TimerModel(
      {required final String nameOfTimer,
      required final String idTimer,
      required final int preparationTime,
      required final int? roundTime,
      required final int resetTime,
      required final TypeTimer type,
      required final int numberOfRounds,
      required final int? firstPhaseDuration,
      required final int? secondPhaseDuration}) = _$TimerModelImpl;

  factory _TimerModel.fromJson(Map<String, dynamic> json) =
      _$TimerModelImpl.fromJson;

  @override
  String get nameOfTimer; // Added nameOfTimer
  @override
  String get idTimer; // Added idTimer
  @override
  int get preparationTime;
  @override
  int? get roundTime;
  @override
  int get resetTime;
  @override
  TypeTimer get type; // Use TypeTimer enum instead of String
  @override
  int get numberOfRounds;
  @override
  int? get firstPhaseDuration;
  @override
  int? get secondPhaseDuration;

  /// Create a copy of TimerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerModelImplCopyWith<_$TimerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
