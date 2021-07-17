import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String text;

  const TagWidget(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.pinkAccent,
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
