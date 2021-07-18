import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AvailableMonthWidget extends StatelessWidget {
  final List<int> monthArray;

  const AvailableMonthWidget(
    this.monthArray, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink[300]!),
      ),
      child: Column(
        children: List.generate(
          2,
          (i) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                6,
                (j) {
                  final index = i * 6 + (j + 1);
                  return Expanded(
                    child: _buildCell(
                      index,
                      isAvailable: monthArray.contains(index),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCell(
    int month, {
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
          DateFormat.MMM().format(DateTime(0, month)),
          style:
              TextStyle(color: isAvailable ? Colors.white : Colors.pink[100]!),
        ),
      ),
    );
  }
}
