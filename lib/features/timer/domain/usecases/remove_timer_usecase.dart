import 'package:box_round_timer/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../repositories/timer_repository.dart';

class RemoveTimerUsecase {
  final TimerRepository _repository;

  RemoveTimerUsecase(this._repository);

  Future<Either<Failure, Unit>> call(String idTimer) async {
    return await _repository.removeTimer(idTimer);
  }
}
