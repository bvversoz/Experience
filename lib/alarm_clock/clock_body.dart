
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gsheets/alarm_clock/toggle_alarm_button.dart';

import 'count_down.dart';
class SetAlarmButton extends StatefulWidget {
  final Function(TimeOfDay) onAlarmSet;

  SetAlarmButton({required this.onAlarmSet});

  @override
  _SetAlarmButtonState createState() => _SetAlarmButtonState();
}

class _SetAlarmButtonState extends State<SetAlarmButton> {
  TimeOfDay _selectedTime = TimeOfDay(hour: 0, minute: 0);

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });

      widget.onAlarmSet(selectedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Set Alarm'),
      onPressed: () => _selectTime(context),
    );
  }
}
