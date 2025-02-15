import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerRoundPickerWidget extends StatelessWidget {
  final String title;
  final int initialSeconds;
  final ValueChanged<int> onSelected;

  const TimerRoundPickerWidget({
    super.key,
    required this.title,
    required this.initialSeconds,
    required this.onSelected,
  });

  void _showPicker(BuildContext context) {
    int selectedMinutes = initialSeconds ~/ 60;
    int selectedSeconds = initialSeconds % 60;

    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
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
                  child: Row(
                    children: [
                      // Minutes Picker
                      Expanded(
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 40,
                          scrollController: FixedExtentScrollController(
                              initialItem: selectedMinutes),
                          onSelectedItemChanged: (index) {
                            selectedMinutes = index;
                          },
                          children: List.generate(
                            60,
                            (index) => Center(
                              child: Text("$index min",
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          ),
                        ),
                      ),
                      // Seconds Picker
                      Expanded(
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 40,
                          scrollController: FixedExtentScrollController(
                              initialItem: selectedSeconds),
                          onSelectedItemChanged: (index) {
                            selectedSeconds = index;
                          },
                          children: List.generate(
                            60,
                            (index) => Center(
                              child: Text("$index sec",
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        int totalSeconds =
                            (selectedMinutes * 60) + selectedSeconds;
                        onSelected(totalSeconds);
                        Navigator.pop(context);
                      },
                      child: const Text("Done",
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
    final int minutes = initialSeconds ~/ 60;
    final int seconds = initialSeconds % 60;
    final String timeDisplay =
        "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";

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
            Text(timeDisplay,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
