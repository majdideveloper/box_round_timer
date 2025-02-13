import 'dart:developer';

import 'package:box_round_timer/core/error/failure.dart';
import 'package:box_round_timer/features/timer/data/datasources/local_data_source/timer_local_data_source.dart';
import 'package:box_round_timer/features/timer/data/models/timer_model.dart';
import 'package:box_round_timer/features/timer/domain/entities/timer_entity.dart';
import 'package:box_round_timer/features/timer/domain/repositories/timer_repository.dart';
import 'package:dartz/dartz.dart';

class TimerRepositoryImpl implements TimerRepository {
  final TimerLocalDataSource localDataSource;
  TimerRepositoryImpl({
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, Unit>> addTimer(TimerEntity timer) async {
    final TimerModel timerModel = TimerModel(
        nameOfTimer: timer.nameOfTimer,
        idTimer: timer.idTimer,
        preparationTime: timer.preparationTime,
        roundTime: timer.roundTime,
        resetTime: timer.resetTime,
        type: timer.type,
        numberOfRounds: timer.numberOfRounds,
        firstPhaseDuration: timer.firstPhaseDuration,
        secondPhaseDuration: timer.secondPhaseDuration);

    try {
      await localDataSource.addTimer(timerModel);
      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TimerEntity>>> getAllTimers() async {
    try {
      final listTimers = await localDataSource.getCachedTimers();
      return Right(listTimers);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeTimer(String idTimer) async {
    try {
      await localDataSource.removeTimer(idTimer);
      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTimer(
      String id, TimerEntity timer) async {
    final TimerModel timerModel = TimerModel(
        nameOfTimer: timer.nameOfTimer,
        idTimer: timer.idTimer,
        preparationTime: timer.preparationTime,
        roundTime: timer.roundTime,
        resetTime: timer.resetTime,
        type: timer.type,
        numberOfRounds: timer.numberOfRounds,
        firstPhaseDuration: timer.firstPhaseDuration,
        secondPhaseDuration: timer.secondPhaseDuration);
    try {
      await localDataSource.updateTimer(id, timerModel);
      return Right(unit);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
