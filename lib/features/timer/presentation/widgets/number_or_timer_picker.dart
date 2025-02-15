import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberOrTimerPicker extends StatefulWidget {
  final String title;
  final int initialValue; // Initial value in seconds
  final ValueChanged<int> onSelected;

  const NumberOrTimerPicker({
    required this.title,
    required this.initialValue,
    required this.onSelected,
  });

  @override
  _NumberOrTimerPickerState createState() => _NumberOrTimerPickerState();
}

class _NumberOrTimerPickerState extends State<NumberOrTimerPicker> {
  int _selectedValue = 0; // Selected value in seconds
  bool _isTimerMode = false; // Toggle between number and timer mode

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showPicker(context),
      child: Text(
        _isTimerMode
            ? '${widget.title}: ${_formatTime(_selectedValue)}'
            : '${widget.title}: $_selectedValue',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    int minutes = _selectedValue ~/ 60;
    int seconds = _selectedValue % 60;
//TODO fix this UI to make the same widget take number of round and duration ....
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: [
                // Segmented Control to switch between Number and Timer
                CupertinoSegmentedControl<bool>(
                  children: {
                    false: Text('Number'),
                    true: Text('Timer'),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      _isTimerMode = value;
                    });
                  },
                  groupValue: _isTimerMode,
                ),
                SizedBox(height: 16),
                // Number Picker
                if (!_isTimerMode)
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          _selectedValue = index;
                        });
                      },
                      children: List.generate(
                        1000, // Adjust the range as needed
                        (index) => Center(
                          child: Text(
                            index.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )
                // Timer Picker (mm:ss)
                else
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Minutes Picker
                        Expanded(
                          child: CupertinoPicker(
                            itemExtent: 40,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                minutes = index;
                                _selectedValue = minutes * 60 + seconds;
                              });
                            },
                            children: List.generate(
                              60, // 0–59 minutes
                              (index) => Center(
                                child: Text(
                                  index.toString().padLeft(2, '0'),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(':', style: TextStyle(fontSize: 20)),
                        // Seconds Picker
                        Expanded(
                          child: CupertinoPicker(
                            itemExtent: 40,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                seconds = index;
                                _selectedValue = minutes * 60 + seconds;
                              });
                            },
                            children: List.generate(
                              60, // 0–59 seconds
                              (index) => Center(
                                child: Text(
                                  index.toString().padLeft(2, '0'),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 16),
                // Done Button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the picker
                    widget.onSelected(
                        _selectedValue); // Return the selected value
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Helper function to format seconds into mm:ss
  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
