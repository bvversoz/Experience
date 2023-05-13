import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer Widget Demo'),
        ),
        body: Center(
          child: TimerWidget(),
        ),
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  double _seconds = 0;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _seconds += 0.1;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _seconds = 0;
    });
  }

  String _formatTime(double time) {
    return time.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Seconds: ${_formatTime(_seconds)}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Start'),
              onPressed: _startTimer,
            ),
            SizedBox(width: 20),
            ElevatedButton(
              child: Text('Stop'),
              onPressed: _stopTimer,
            ),
            SizedBox(width: 20),
            ElevatedButton(
              child: Text('Reset'),
              onPressed: _resetTimer,
            ),
          ],
        ),
      ],
    );
  }
}
