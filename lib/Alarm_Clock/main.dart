import 'package:flutter/material.dart';

import 'home_screen.dart';

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

