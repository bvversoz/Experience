import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gsheets/alarm_clock/text_style_class.dart';

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

  bool _isAlarmTime() {
    final now = TimeOfDay.now();
    return now == _selectedTime;
  }

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
    final alarmTime = TimeOfDay(hour: _selectedTime.hour, minute: _selectedTime.minute);
    final isAlarmTime = _isAlarmTime();
    final timeUntilAlarm = _getTimeUntilAlarm();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Alarm Clock',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Current Time: ${TimeOfDay.now().format(context)}'),
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
            if (isAlarmTime)
              Text(
                'Wake up!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            if (_isTimerSet && !isAlarmTime && timeUntilAlarm.inSeconds > 0)
              CountdownWidget(
                duration: timeUntilAlarm,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(_isAlarmOn ? 'Turn off Alarm' : 'Turn on Alarm'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Set the background color to black
              ),
              onPressed: _toggleAlarm,
            ),
            SizedBox(height: 20),
            TextButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Set the background color to black
              ),
              child: Text('Set Alarm Time', style: TextStyle(color: Colors.yellowAccent),),
              onPressed: () => _selectTime(context),
            ),
          ],
        ),
      ),

    );
  }

}

