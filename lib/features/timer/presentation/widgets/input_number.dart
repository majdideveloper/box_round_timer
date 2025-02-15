import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSNumberPicker extends StatelessWidget {
  final String title;
  final int initialValue;
  final ValueChanged<int> onSelected;

  const IOSNumberPicker({
    required this.title,
    required this.initialValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showNumberPicker(context),
      child: Text(
        '$title: $initialValue',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  void _showNumberPicker(BuildContext context) {
    int selectedValue = initialValue;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          child: Column(
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Number Picker
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  onSelectedItemChanged: (index) {
                    selectedValue = index;
                  },
                  children: List.generate(
                    100, // Adjust the range as needed
                    (index) => Center(
                      child: Text(
                        index.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              // Done Button
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the picker
                  onSelected(selectedValue); // Return the selected value
                },
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
