import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Count:',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '$_count',
          style: TextStyle(fontSize: 40),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCount,
          child: Text('Increment'),
        ),
      ],
    );
  }
}
