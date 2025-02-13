import 'package:box_round_timer/features/timer/domain/entities/timer_entity.dart';
import 'package:box_round_timer/features/timer/presentation/cubit/timer_cubit.dart';
import 'package:box_round_timer/features/timer/presentation/pages/add_or_update_timer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timers')),
      body: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('No timers available')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (timers) => ListView.builder(
              itemCount: timers.length,
              itemBuilder: (context, index) {
                final timer = timers[index];
                return ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddOrUpdateTimerPage(
                              timerEntity: timer,
                            )),
                  ),
                  title: Text(timer.nameOfTimer),
                  subtitle: Text('Duration: ${timer.preparationTime} sec'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<TimerCubit>().deleteTimer(timer.idTimer);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddOrUpdateTimerPage()),
          );
          // final newTimer = TimerEntity(
          //     nameOfTimer: "nameOfTimer",
          //     idTimer: const Uuid().v1(),
          //     preparationTime: 60,
          //     resetTime: 60,
          //     type: TypeTimer.normal,
          //     numberOfRounds: 3);
          // context.read<TimerCubit>().createTimer(newTimer);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
