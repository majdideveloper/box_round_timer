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
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RunTimerCubit(timer ?? TimerEntity.defaultTimer()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Timer")),
        body: BlocBuilder<RunTimerCubit, RunTimerState>(
          builder: (context, state) {
            // Calculate the total time for the current phase
            int totalTime;
            if (state.isPreparation) {
              totalTime = state.timer.preparationTime;
            } else if (state.isResting) {
              totalTime = state.timer.resetTime;
            } else {
              totalTime = state.timer.roundTime ?? 0;
            }

            // Calculate the progress value (remaining time / total time)
            double progress =
                totalTime > 0 ? (state.remainingTime / totalTime) : 0;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular Progress Indicator
                  SizedBox(
                    width: size.width,
                    height: size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background Circle
                        // CircularProgressIndicator(
                        //   value: 1.0,
                        //   backgroundColor: Colors.grey[300],
                        //   strokeWidth: 10,
                        // ),
                        // Progress Circle
                        SizedBox(
                          width: size.width,
                          height: size.width,
                          child: CircularProgressIndicator(
                            value: progress,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              state.isPreparation
                                  ? Colors.blue
                                  : state.isResting
                                      ? Colors.green
                                      : Colors.red,
                            ),
                            strokeWidth: 10,
                          ),
                        ),
                        // Remaining Time Text
                        Text(
                          "${state.remainingTime} sec",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Phase Text
                  if (state.isPreparation)
                    Text(
                      "Preparation",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (state.isResting)
                    Text(
                      "Rest",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (!state.isPreparation && !state.isResting)
                    Text(
                      "Round ${state.currentRound}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 20),
                  // Round Progress Text
                  Text(
                    "${state.isFirstPhase}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  // Buttons
                  if (state.status == TimerStatus.initial ||
                      state.status == TimerStatus.paused)
                    ElevatedButton(
                      onPressed: () =>
                          context.read<RunTimerCubit>().startTimer(),
                      child: const Text("Start"),
                    ),
                  if (state.status == TimerStatus.running)
                    ElevatedButton(
                      onPressed: () =>
                          context.read<RunTimerCubit>().pauseTimer(),
                      child: const Text("Pause"),
                    ),
                  if (state.status == TimerStatus.finished)
                    ElevatedButton(
                      onPressed: () =>
                          context.read<RunTimerCubit>().resetTimer(),
                      child: const Text("Reset"),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
