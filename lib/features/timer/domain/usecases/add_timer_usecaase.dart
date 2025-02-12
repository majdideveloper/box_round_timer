import 'package:box_round_timer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../repositories/timer_repository.dart';
import '../entities/timer_entity.dart';

class AddTimerUsecase {
  final TimerRepository _repository;

  AddTimerUsecase(this._repository);

  Future<Either<Failure, Unit>> call(TimerEntity timer) async {
    return await _repository.addTimer(timer);
  }
}
