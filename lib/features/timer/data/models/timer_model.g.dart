// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerModelImpl _$$TimerModelImplFromJson(Map<String, dynamic> json) =>
    _$TimerModelImpl(
      preparationTime: (json['preparationTime'] as num).toInt(),
      roundTime: (json['roundTime'] as num?)?.toInt(),
      resetTime: (json['resetTime'] as num).toInt(),
      type: json['type'] as String,
      numberOfRounds: (json['numberOfRounds'] as num).toInt(),
      firstPhaseDuration: (json['firstPhaseDuration'] as num?)?.toInt(),
      secondPhaseDuration: (json['secondPhaseDuration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TimerModelImplToJson(_$TimerModelImpl instance) =>
    <String, dynamic>{
      'preparationTime': instance.preparationTime,
      'roundTime': instance.roundTime,
      'resetTime': instance.resetTime,
      'type': instance.type,
      'numberOfRounds': instance.numberOfRounds,
      'firstPhaseDuration': instance.firstPhaseDuration,
      'secondPhaseDuration': instance.secondPhaseDuration,
    };
