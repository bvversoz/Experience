import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gsheets/alarm_clock/toggle_alarm_button.dart';

import 'appbar.dart';
import 'clock_body.dart';
import 'count_down.dart';

void main() => runApp(AlarmClockApp());

class AlarmClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alarm Clock',
      home: AlarmClockScreen(),
    );
  }
}

class AlarmClockScreen extends StatefulWidget {
  @override
  _AlarmClockScreenState createState() => _AlarmClockScreenState();
}

class _AlarmClockScreenState extends State<AlarmClockScreen> {
  late Timer _timer;
  bool _isAlarmOn = false;
  TimeOfDay _selectedTime = TimeOfDay(hour: 0, minute: 0);
  bool _isTimerSet = false; // Added variable to track if the timer has been set

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _toggleAlarm() {
    setState(() {
      _isAlarmOn = !_isAlarmOn;
      _isTimerSet = _isAlarmOn ? true : false; // Update the timer set status
    });
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
        _isTimerSet = true; // Set the timer status to true when a time is selected
      });
    }
  }

  bool _AlarmTime() {
    final now = TimeOfDay.now();
    return now == _selectedTime;
  }

 // This code calculates the time remaining until a selected alarm time by subtracting the current time from the selected time.
  Duration _getTimeUntilAlarm() {
    final now = DateTime.now();
    final alarmDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );
    return alarmDateTime.difference(now);
  }

  @override
  Widget build(BuildContext context) {
    final currentTime = TimeOfDay.now();
    final alarmTime = TimeOfDay(hour: _selectedTime.hour, minute: _selectedTime.minute);
    final isAlarmTime = currentTime == alarmTime;
    final timeUntilAlarm = _getTimeUntilAlarm();

    String formattedTimeUntilAlarm = '${timeUntilAlarm.inHours}:${timeUntilAlarm.inMinutes.remainder(60).toString().padLeft(2, '0')}:${timeUntilAlarm.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AlarmAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Current Time: ${currentTime.format(context)}'),
            SizedBox(height: 20),
            if (_isTimerSet)
              Column(
                children: [
                  Text('Alarm Time: ${alarmTime.format(context)}'),
                  SizedBox(height: 20),
                ],
              ),
            Text('Alarm Status: ${_isAlarmOn ? 'On' : 'Off'}'),
            SizedBox(height: 20),

            AlarmButton(
              isAlarmOn: _isAlarmOn,
              onPressed: _toggleAlarm,
            ),
            SizedBox(height: 20),
            SetAlarmButton(
              onAlarmSet: (selectedTime) {
                setState(() {
                  _selectedTime = selectedTime;
                  _isTimerSet = true; // Set the timer status to true when a time is selected
                });
              },
            ),
            SizedBox(height: 20),
            if (_isAlarmOn && !isAlarmTime)
              CountdownWidget(
                duration: timeUntilAlarm,
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}