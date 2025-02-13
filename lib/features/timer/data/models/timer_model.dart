import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/timer_entity.dart';

part 'timer_model.freezed.dart';
part 'timer_model.g.dart';

@freezed
class TimerModel with _$TimerModel {
  const factory TimerModel({
    required String nameOfTimer, // Added nameOfTimer
    required String idTimer, // Added idTimer
    required int preparationTime,
    required int? roundTime,
    required int resetTime,
    required TypeTimer type, // Use TypeTimer enum instead of String
    required int numberOfRounds,
    required int? firstPhaseDuration,
    required int? secondPhaseDuration,
  }) = _TimerModel;

  /// Factory method to convert a [TimerEntity] into a [TimerModel]
  factory TimerModel.fromEntity(TimerEntity entity) => TimerModel(
        nameOfTimer: entity.nameOfTimer,
        idTimer: entity.idTimer,
        preparationTime: entity.preparationTime,
        roundTime: entity.roundTime,
        resetTime: entity.resetTime,
        type: entity.type, // Directly map the TypeTimer enum
        numberOfRounds: entity.numberOfRounds,
        firstPhaseDuration: entity.firstPhaseDuration,
        secondPhaseDuration: entity.secondPhaseDuration,
      );

  /// Factory method for JSON serialization
  factory TimerModel.fromJson(Map<String, dynamic> json) =>
      _$TimerModelFromJson(json);
}

extension TimerModelMapper on TimerModel {
  TimerEntity toEntity() {
    return TimerEntity(
      nameOfTimer: nameOfTimer,
      idTimer: idTimer,
      preparationTime: preparationTime,
      resetTime: resetTime,
      type: type,
      numberOfRounds: numberOfRounds,
      roundTime: roundTime,
      firstPhaseDuration: firstPhaseDuration,
      secondPhaseDuration: secondPhaseDuration,
    );
  }
}
