// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:box_round_timer/features/timer/presentation/widgets/custom_timer_or_number_input.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/input_number.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/number_or_timer_picker.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/round_picker_widget.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/timer_round_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:box_round_timer/features/timer/domain/entities/timer_entity.dart';
import 'package:box_round_timer/features/timer/presentation/cubit/timer_cubit/timer_cubit.dart';

class AddOrUpdateTimerPage extends StatefulWidget {
  final TimerEntity? timerEntity;
  const AddOrUpdateTimerPage({
    Key? key,
    this.timerEntity,
  }) : super(key: key);

  @override
  State<AddOrUpdateTimerPage> createState() => _AddOrUpdateTimerPageState();
}

class _AddOrUpdateTimerPageState extends State<AddOrUpdateTimerPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  TypeTimer selectedType = TypeTimer.normal;

  int preprationTime = 30;

  int numberOfRound = 3;

  int roundTime = 30;

  int firstPhaseRound = 30;

  int secondPhasePound = 30;

  int restTime = 30;

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.timerEntity != null) {
      _nameController.text = widget.timerEntity!.nameOfTimer;
    } else {
      //TODO refactor this code to make more redable
      _nameController.text = TimerEntity.defaultTimer().nameOfTimer;
    }
    super.initState();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      log(_formKey.currentState!.validate().toString());
      // Create a new TimerEntity
      final newTimer = TimerEntity(
        nameOfTimer: _nameController.text,
        idTimer: const Uuid().v1(), // Generate a unique ID
        preparationTime: preprationTime,
        resetTime: restTime,
        type: selectedType,
        numberOfRounds: numberOfRound,
        roundTime: selectedType == TypeTimer.dualPhase
            ? firstPhaseRound + secondPhasePound
            : roundTime,
        firstPhaseDuration: firstPhaseRound,
        secondPhaseDuration: secondPhasePound,
      );
      if (widget.timerEntity != null) {
        context
            .read<TimerCubit>()
            .editTimer(widget.timerEntity!.idTimer, newTimer);
      } else {
        // Call the Cubit to create the timer
        context.read<TimerCubit>().createTimer(newTimer);
      }

      // Navigate back to the previous screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.timerEntity != null
            ? '__Update Timer'
            : '__Create New Timer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Enter name of Timer',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name of timer';
                  }
                  return null;
                },
              ),
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
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              Text('${selectedType.name}'),
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
              selectedType == TypeTimer.normal
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

              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.timerEntity != null
                    ? '__Update Timer'
                    : '__Create Timer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
