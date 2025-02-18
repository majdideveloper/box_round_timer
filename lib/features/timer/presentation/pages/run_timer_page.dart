// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:box_round_timer/features/timer/domain/entities/timer_entity.dart';
import 'package:box_round_timer/features/timer/presentation/cubit/run_timer_cubit/cubit/run_timer_cubit.dart';

class RunTimerPage extends StatelessWidget {
  final TimerEntity? timer;
  const RunTimerPage({
    Key? key,
    this.timer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RunTimerCubit(timer ?? TimerEntity.defaultTimer()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Timer")),
        body: BlocBuilder<RunTimerCubit, RunTimerState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Time: ${state.remainingTime} sec",
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                    "Round: ${state.currentRound}/${state.timer.numberOfRounds}"),
                const SizedBox(height: 20),
                if (state.status == TimerStatus.initial ||
                    state.status == TimerStatus.paused)
                  ElevatedButton(
                    onPressed: () => context.read<RunTimerCubit>().startTimer(),
                    child: const Text("Start"),
                  ),
                if (state.status == TimerStatus.running)
                  ElevatedButton(
                    onPressed: () => context.read<RunTimerCubit>().pauseTimer(),
                    child: const Text("Pause"),
                  ),
                if (state.status == TimerStatus.finished)
                  ElevatedButton(
                    onPressed: () => context.read<RunTimerCubit>().resetTimer(),
                    child: const Text("Reset"),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
