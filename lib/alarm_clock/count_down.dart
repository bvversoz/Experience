import 'dart:async';
import 'package:flutter/material.dart';

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
            'Time until alarm: ${_formatDuration(_remainingTime)}',
            style: TextStyle(fontSize: 14, color: Colors.redAccent),
          ),
        if (!_isTimeHidden && !widget.hideButton)
          ElevatedButton(
            child: Text('Hide'),
            onPressed: _toggleTimeVisibility,
          ),
      ],
    );
  }
}
