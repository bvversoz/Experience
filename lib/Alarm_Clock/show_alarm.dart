import 'dart:async';
import 'package:flutter/material.dart';

class ShowAlarm extends StatefulWidget {
  final Duration duration;
  final bool hideButton;

  const ShowAlarm({
    required this.duration,
    this.hideButton = false,
  });

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<ShowAlarm> {
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
          Padding(
            padding: EdgeInsets.only(bottom: 8.0), // Adjust the spacing as needed
            child: Text(
              'Time until: ${_formatDuration(_remainingTime)}',
              style: TextStyle(fontSize: 14, color: Colors.redAccent),
            ),
          ),
        if (!_isTimeHidden && !widget.hideButton)
          TextButton(
            child: Text('Hide'),
            onPressed: _toggleTimeVisibility,
          ),
      ],
    );

  }
}
