import 'package:box_round_timer/core/error/failure.dart';
import 'package:box_round_timer/features/timer/domain/entities/timer_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TimerRepository {
  /// Adds a new timer configuration.
  Future<Either<Failure, Unit>> addTimer(TimerEntity timer);

  /// Updates an existing timer configuration.
  Future<Either<Failure, Unit>> updateTimer(
      String id, TimerEntity updatedTimer);

  /// Removes a timer by its unique ID.
  Future<Either<Failure, Unit>> removeTimer(String idTimer);

  /// Retrieves all saved timers.
  Future<Either<Failure, List<TimerEntity>>> getAllTimers();
}
