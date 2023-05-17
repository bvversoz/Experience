import 'package:flutter/material.dart';

class SecondaryChips extends StatelessWidget {
  final List<String> additionalItems = [
    'Mobile App Development',
    'Front-end Development',
    'Back-end Development',
    'UI/UX Design',
    'Agile Methodologies',
    'Problem Solving',
    'Team Leadership',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: additionalItems.map((item) {
          return Chip(
            elevation: 4,
            shadowColor: Colors.black,
            label: Text(item),
            backgroundColor: Colors.black12,
            labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 10,
            ),
          );
        }).toList(),
      ),
    );
  }
}