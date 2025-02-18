import 'package:box_round_timer/features/timer/domain/entities/timer_entity.dart';
import 'package:box_round_timer/features/timer/presentation/pages/run_timer_page.dart';
import 'package:box_round_timer/features/timer/presentation/pages/timer_page.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/round_picker_widget.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/timer_round_picker_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int preprationTime = 30;

  int numberOfRound = 3;

  int roundTime = 30;

  int firstPhaseRound = 30;

  int secondPhasePound = 30;

  int restTime = 30;
  TypeTimer _selectedType = TypeTimer.normal;

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
            //TODO fix this radio button to save the correct value
            //TODO make this widget in common widget to use in home page and in this page
            // Text('Timer Type',
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              children: TypeTimer.values.map((type) {
                return Expanded(
                  child: RadioListTile<TypeTimer>(
                    title: Text(type.toString().split('.').last),
                    value: type,
                    groupValue: _selectedType,
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            TimerRoundPickerWidget(
              title: "Preparation Time",
              initialSeconds: preprationTime,
              onSelected: (value) {
                setState(() {
                  preprationTime = value;
                });
              },
            ),
            RoundPickerWidget(
              title: "Number of Rounds",
              minValue: 1,
              maxValue: 20,
              initialValue: numberOfRound,
              onSelected: (value) {
                setState(() {
                  numberOfRound = value;
                });
              },
            ),
            _selectedType == TypeTimer.normal
                ? TimerRoundPickerWidget(
                    title: "Round Time",
                    initialSeconds: roundTime,
                    onSelected: (value) {
                      setState(() {
                        roundTime = value;
                      });
                    },
                  )
                : Column(
                    spacing: 20,
                    children: [
                      TimerRoundPickerWidget(
                        title: "First Phase",
                        initialSeconds: firstPhaseRound,
                        onSelected: (value) {
                          setState(() {
                            firstPhaseRound = value;
                          });
                        },
                      ),
                      TimerRoundPickerWidget(
                        title: "Second Phase",
                        initialSeconds: secondPhasePound,
                        onSelected: (value) {
                          setState(() {
                            secondPhasePound = value;
                          });
                        },
                      )
                    ],
                  ),
            TimerRoundPickerWidget(
              title: "Rest Time",
              initialSeconds: restTime,
              onSelected: (value) {
                setState(() {
                  restTime = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimerPage()),
              );
            },
            child: Icon(Icons.list),
          ),
          FloatingActionButton.large(
            onPressed: () {
              if (_selectedType == TypeTimer.normal) {
                final TimerEntity timer = TimerEntity(
                  nameOfTimer: "",
                  idTimer: "",
                  preparationTime: preprationTime,
                  resetTime: restTime,
                  roundTime: roundTime,
                  type: _selectedType,
                  numberOfRounds: numberOfRound,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RunTimerPage(
                            timer: timer,
                          )),
                );
              } else {
                final TimerEntity timer = TimerEntity(
                  nameOfTimer: "",
                  idTimer: "",
                  preparationTime: preprationTime,
                  resetTime: restTime,
                  type: _selectedType,
                  roundTime: firstPhaseRound + secondPhasePound,
                  numberOfRounds: numberOfRound,
                  firstPhaseDuration: firstPhaseRound,
                  secondPhaseDuration: secondPhasePound,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RunTimerPage(
                            timer: timer,
                          )),
                );
              }
            },
            child: Icon(Icons.play_arrow),
          )
        ],
      ),
    );
  }
}
