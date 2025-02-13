import 'dart:convert';

import 'package:box_round_timer/features/timer/domain/entities/timer_entity.dart';

class TimerModel extends TimerEntity {
  final String nameOfTimer;
  final String idTimer;
  final int preparationTime;
  final int? roundTime;
  final int resetTime;
  final TypeTimer type;
  final int numberOfRounds;
  final int? firstPhaseDuration;
  final int? secondPhaseDuration;

  TimerModel({
    required this.nameOfTimer,
    required this.idTimer,
    required this.preparationTime,
    required this.roundTime,
    required this.resetTime,
    required this.type,
    required this.numberOfRounds,
    required this.firstPhaseDuration,
    required this.secondPhaseDuration,
  }) : super(
          nameOfTimer: nameOfTimer,
          idTimer: idTimer,
          preparationTime: preparationTime,
          resetTime: resetTime,
          type: type,
          numberOfRounds: numberOfRounds,
        );

  /// ✅ Convert a JSON Map into a `TimerModel`
  factory TimerModel.fromJson(Map<String, dynamic> json) {
    return TimerModel(
      nameOfTimer: json['nameOfTimer'],
      idTimer: json['idTimer'],
      preparationTime: json['preparationTime'],
      roundTime: json['roundTime'],
      resetTime: json['resetTime'],
      type: TypeTimer.values
          .firstWhere((e) => e.toString() == json['type']), // Enum conversion
      numberOfRounds: json['numberOfRounds'],
      firstPhaseDuration: json['firstPhaseDuration'],
      secondPhaseDuration: json['secondPhaseDuration'],
    );
  }

  /// ✅ Convert the `TimerModel` into a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'nameOfTimer': nameOfTimer,
      'idTimer': idTimer,
      'preparationTime': preparationTime,
      'roundTime': roundTime,
      'resetTime': resetTime,
      'type': type.toString(), // Store enum as String
      'numberOfRounds': numberOfRounds,
      'firstPhaseDuration': firstPhaseDuration,
      'secondPhaseDuration': secondPhaseDuration,
    };
  }

  /// ✅ Create a copy with modified values
  TimerModel copyWith({
    String? nameOfTimer,
    String? idTimer,
    int? preparationTime,
    int? roundTime,
    int? resetTime,
    TypeTimer? type,
    int? numberOfRounds,
    int? firstPhaseDuration,
    int? secondPhaseDuration,
  }) {
    return TimerModel(
      nameOfTimer: nameOfTimer ?? this.nameOfTimer,
      idTimer: idTimer ?? this.idTimer,
      preparationTime: preparationTime ?? this.preparationTime,
      roundTime: roundTime ?? this.roundTime,
      resetTime: resetTime ?? this.resetTime,
      type: type ?? this.type,
      numberOfRounds: numberOfRounds ?? this.numberOfRounds,
      firstPhaseDuration: firstPhaseDuration ?? this.firstPhaseDuration,
      secondPhaseDuration: secondPhaseDuration ?? this.secondPhaseDuration,
    );
  }

  /// ✅ Convert a JSON string to a `TimerModel`
  static TimerModel fromJsonString(String jsonString) {
    return TimerModel.fromJson(jsonDecode(jsonString));
  }

  /// ✅ Convert `TimerModel` to a JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }
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
