//
// import 'dart:async';
// import 'package:flutter/material.dart';
//
// import 'count_down.dart';
// import 'main.dart';
//
//
//
// class _AlarmClockScreenState extends State<AlarmClockScreen> {
//   late Timer _timer;
//   bool _isAlarmOn = false;
//   TimeOfDay _selectedTime = TimeOfDay(hour: 0, minute: 0);
//   bool _isTimerSet = false;
//   bool _isCountdownActive = false; // Added variable to track countdown active state
//   bool _isAlarmTime() {
//     final now = TimeOfDay.now();
//     return now == _selectedTime;
//   }
//   Duration _getTimeUntilAlarm() {
//     final now = DateTime.now();
//     final alarmDateTime = DateTime(
//       now.year,
//       now.month,
//       now.day,
//       _selectedTime.hour,
//       _selectedTime.minute,
//     );
//     return alarmDateTime.difference(now);
//   }
//   @override
//   Widget build(BuildContext context) {
//     final alarmTime = TimeOfDay(hour: _selectedTime.hour, minute: _selectedTime.minute);
//     final isAlarmTime = _isAlarmTime();
//     final timeUntilAlarm = _getTimeUntilAlarm();
//
//     return Scaffold(
//       appBar: AppBar(
//         // AppBar code...
//       ),
//       body: Center(
//         child: Column(
//           // Column code...
//           children: [
//             // Existing code...
//             if (_isTimerSet && !isAlarmTime && timeUntilAlarm.inSeconds > 0)
//               AnimatedOpacity(
//                 duration: Duration(milliseconds: 500),
//                 opacity: _isCountdownActive ? 1.0 : 0.0,
//                 child: Column(
//                   children: [
//                     CountdownWidget(duration: timeUntilAlarm),
//                     ElevatedButton(
//                       child: Text('Hide', style: TextStyle(color: Colors.blue)),
//                       onPressed: () {
//                         setState(() {
//                           _isCountdownActive = false;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             // Existing code...
//           ],
//         ),
//       ),
//     );
//   }
// }
