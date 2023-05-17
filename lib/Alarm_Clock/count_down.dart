import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gsheets/alarm_clock/text_style_class.dart';

class CountdownWidget extends StatefulWidget {
  final Duration duration;
  final bool hideButton;

  const CountdownWidget({
    required this.duration,
    this.hideButton = false,
  });

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer _timer;
  late Duration _remainingTime;
  bool _isTimeHidden = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - Duration(seconds: 1);
        } else {
          timer.cancel();
          if (_isAlarmTimeReached()) {
            _showAlertDialog('Wake Up!');
          }
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  bool _isAlarmTimeReached() {
    final now = DateTime.now();
    final alarmTime = now.subtract(Duration(seconds: _remainingTime.inSeconds));
    final currentTime = TimeOfDay.fromDateTime(now);
    return alarmTime.hour == currentTime.hour && alarmTime.minute == currentTime.minute;
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _toggleTimeVisibility() {
    setState(() {
      _isTimeHidden = !_isTimeHidden;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_isTimeHidden)
          Text(
            '${_formatDuration(_remainingTime)}',
            style: TextStyle(fontSize: 14, color: Colors.redAccent),
          ),
        if (!_isTimeHidden && !widget.hideButton)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Set the button background color to black
            ),
            child: Text(
              'Hide',
              style: LowProfileTextStyle().dark,
            ),
            onPressed: _toggleTimeVisibility,
          ),
      ],
    );
  }
}
