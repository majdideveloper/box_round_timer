import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/timer_entity.dart';

part 'timer_model.freezed.dart';
part 'timer_model.g.dart';

@freezed
class TimerModel with _$TimerModel {
  const factory TimerModel({
    required int preparationTime,
    required int? roundTime,
    required int resetTime,
    required String type, // Store type as a string
    required int numberOfRounds,
    required int? firstPhaseDuration,
    required int? secondPhaseDuration,
  }) = _TimerModel;

  /// Factory method to convert a [TimerEntity] into a [TimerModel]
  factory TimerModel.fromEntity(TimerEntity entity) => TimerModel(
        preparationTime: entity.preparationTime,
        roundTime: entity.roundTime,
        resetTime: entity.resetTime,
        type: entity.type, // Directly map the type string
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
      // nameOfTimer: nameOfTimer,
      numberOfRounds: numberOfRounds,
      preparationTime: preparationTime,
      resetTime: resetTime,
      roundTime: roundTime,
      type: type,
      firstPhaseDuration: firstPhaseDuration,
      secondPhaseDuration: secondPhaseDuration,
    );
  }
}
