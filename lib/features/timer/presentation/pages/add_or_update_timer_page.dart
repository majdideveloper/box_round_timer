// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:box_round_timer/features/timer/presentation/widgets/custom_timer_or_number_input.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/input_number.dart';
import 'package:box_round_timer/features/timer/presentation/widgets/number_or_timer_picker.dart';
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
  final _preparationTimeController = TextEditingController();
  final _resetTimeController = TextEditingController();
  final _numberOfRoundsController = TextEditingController();
  TypeTimer _selectedType = TypeTimer.normal;

  @override
  void dispose() {
    _nameController.dispose();
    _preparationTimeController.dispose();
    _resetTimeController.dispose();
    _numberOfRoundsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.timerEntity != null) {
      _nameController.text = widget.timerEntity!.nameOfTimer;
      _preparationTimeController.text =
          widget.timerEntity!.preparationTime.toString();
      _resetTimeController.text = widget.timerEntity!.resetTime.toString();
      _numberOfRoundsController.text =
          widget.timerEntity!.numberOfRounds.toString();
    } else {
      //TODO refactor this code to make more redable
      _nameController.text = TimerEntity.defaultTimer().nameOfTimer;
      _preparationTimeController.text =
          TimerEntity.defaultTimer().preparationTime.toString();
      _resetTimeController.text =
          TimerEntity.defaultTimer().resetTime.toString();
      _numberOfRoundsController.text =
          TimerEntity.defaultTimer().numberOfRounds.toString();
    }
    super.initState();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Create a new TimerEntity
      final newTimer = TimerEntity(
        nameOfTimer: _nameController.text,
        idTimer: const Uuid().v1(), // Generate a unique ID
        preparationTime: int.parse(_preparationTimeController.text),
        resetTime: int.parse(_resetTimeController.text),
        type: _selectedType,
        numberOfRounds: int.parse(_numberOfRoundsController.text),
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
          child: ListView(
            children: [
              CustomTimerOrNumberInput(
                  isTimer: true,
                  onChanged: (number) =>
                      _preparationTimeController.text == number),
              NumberOrTimerPicker(
                title: 'Preparation Time',
                initialValue: int.parse(_preparationTimeController.text),
                onSelected: (value) {
                  setState(() {
                    //TODO i need default timer to make work every time
                    _preparationTimeController.text = value.toString();
                  });
                },
              ),
              IOSNumberPicker(
                title: 'Reset Time (seconds)',
                initialValue: int.parse(_resetTimeController.text),
                onSelected: (value) {
                  setState(() {
                    _resetTimeController.text = value.toString();
                  });
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: '__Timer Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name for the timer';
                  }
                  return null;
                },
              ),
              //TODO fix this radio button to save the correct value
              //TODO make this widget in common widget to use in home page and in this page
              Text('Timer Type',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
              TextFormField(
                controller: _preparationTimeController,
                decoration:
                    InputDecoration(labelText: 'Preparation Time (seconds)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the preparation time';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _resetTimeController,
                decoration: InputDecoration(labelText: 'Reset Time (seconds)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the reset time';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _numberOfRoundsController,
                decoration: InputDecoration(labelText: 'Number of Rounds'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of rounds';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
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
