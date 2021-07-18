import 'package:flutter/material.dart';

class AvailableTimeWidget extends StatelessWidget {
  final List<int> timeArray;

  const AvailableTimeWidget(
    this.timeArray, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink[300]!),
      ),
      child: Column(
        children: List.generate(2, (i) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              12,
              (j) {
                final index = i * 12 + j;
                return Expanded(
                  child: _buildCell(
                    index,
                    isAvailable: timeArray.contains(index),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCell(
    int time, {
    required bool isAvailable,
  }) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        color: isAvailable ? Colors.pink : Colors.white,
        border: Border.all(
          color: isAvailable ? Colors.white : Colors.pink[100]!,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Text(
          time.toString(),
          style:
              TextStyle(color: isAvailable ? Colors.white : Colors.pink[100]!),
        ),
      ),
    );
  }
}
