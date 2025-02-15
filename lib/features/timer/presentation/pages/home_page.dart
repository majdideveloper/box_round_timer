import 'package:box_round_timer/features/timer/presentation/pages/run_timer_page.dart';
import 'package:box_round_timer/features/timer/presentation/pages/timer_page.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/round_picker_widget.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/timer_round_picker_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("__BOX ROUND TIMER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            TimerRoundPickerWidget(
              title: "Preparation Time",
              initialSeconds: 30,
              onSelected: (value) {},
            ),
            RoundPickerWidget(
              title: "Number of Rounds",
              minValue: 1,
              maxValue: 20,
              initialValue: 3,
              onSelected: (value) {},
            ),
            TimerRoundPickerWidget(
              title: "Round Time",
              initialSeconds: 30,
              onSelected: (value) {},
            ),
            TimerRoundPickerWidget(
              title: "Rest Time",
              initialSeconds: 30,
              onSelected: (value) {},
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TimerPage()),
            );
          }),
          FloatingActionButton.large(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RunTimerPage()),
            );
          })
        ],
      ),
    );
  }
}
