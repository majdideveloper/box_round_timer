import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundPickerWidget extends StatelessWidget {
  final String title;
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onSelected;

  const RoundPickerWidget({
    super.key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onSelected,
  });

  void _showPicker(BuildContext context) {
    int selectedValue = initialValue;

    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // Adjust width
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 180,
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                        initialItem: initialValue - minValue),
                    onSelectedItemChanged: (index) {
                      selectedValue = minValue + index;
                      onSelected(selectedValue);
                    },
                    children: List.generate(
                      maxValue - minValue + 1,
                      (index) => Center(
                        child: Text(
                          "${minValue + index}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Text("$initialValue",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
