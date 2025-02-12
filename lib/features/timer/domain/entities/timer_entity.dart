enum TypeTimer { normal, dualPhase }

class TimerEntity {
  /// The time before the round starts (in seconds)
  final int preparationTime;

  /// The duration of a single round (in seconds)
  final int? roundTime;

  /// The time interval between rounds (in seconds)
  final int resetTime;

  /// The type of the round: 'normal' or 'dualPhase'
  final TypeTimer type;

  /// The total number of rounds in the timer session
  final int numberOfRounds;

  /// The duration of the first phase (for dualPhase rounds)
  final int? firstPhaseDuration;

  /// The duration of the second phase (for dualPhase rounds)
  final int? secondPhaseDuration;

  TimerEntity({
    required this.preparationTime,
    required this.resetTime,
    required this.type,
    required this.numberOfRounds,
    this.roundTime,
    this.firstPhaseDuration,
    this.secondPhaseDuration,
  });
}
