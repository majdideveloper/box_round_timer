import 'package:box_round_timer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../repositories/timer_repository.dart';
import '../entities/timer_entity.dart';

class UpdateTimerUsecase {
  final TimerRepository _repository;

  UpdateTimerUsecase(this._repository);

  Future<Either<Failure, Unit>> call(
      String idTimer, TimerEntity updatedTimer) async {
    return await _repository.updateTimer(idTimer, updatedTimer);
  }
}
