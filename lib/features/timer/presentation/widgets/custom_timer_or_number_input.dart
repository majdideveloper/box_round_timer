import 'package:flutter/material.dart';

class CustomTimerOrNumberInput extends StatefulWidget {
  final bool isTimer; // true for timer, false for number input
  final Function(dynamic) onChanged;

  const CustomTimerOrNumberInput(
      {super.key, required this.isTimer, required this.onChanged});

  @override
  State<CustomTimerOrNumberInput> createState() =>
      _CustomTimerOrNumberInputState();
}

class _CustomTimerOrNumberInputState extends State<CustomTimerOrNumberInput> {
  Duration _selectedDuration = Duration();
  int _selectedNumber = 0;

  void _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: _selectedDuration.inHours,
          minute: _selectedDuration.inMinutes % 60),
    );

    if (time != null) {
      setState(() {
        _selectedDuration = Duration(hours: time.hour, minutes: time.minute);
      });
      widget.onChanged(_selectedDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isTimer
        ? GestureDetector(
            onTap: _pickTime,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _selectedDuration.inHours.toString().padLeft(2, '0') +
                    ":" +
                    (_selectedDuration.inMinutes % 60)
                        .toString()
                        .padLeft(2, '0'),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (_selectedNumber > 0) _selectedNumber--;
                  });
                  widget.onChanged(_selectedNumber);
                },
              ),
              Text(
                '$_selectedNumber',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _selectedNumber++;
                  });
                  widget.onChanged(_selectedNumber);
                },
              ),
            ],
          );
  }
}
