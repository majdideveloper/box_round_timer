import 'package:box_round_timer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../repositories/timer_repository.dart';
import '../entities/timer_entity.dart';

class GetAllTimersUsecase {
  final TimerRepository _repository;

  GetAllTimersUsecase(this._repository);

  Future<Either<Failure, List<TimerEntity>>> call() async {
    return await _repository.getAllTimers();
  }
}
