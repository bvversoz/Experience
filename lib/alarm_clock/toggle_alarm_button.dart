import 'package:flutter/material.dart';



class AlarmButton extends StatelessWidget {
  final bool isAlarmOn;
  final VoidCallback onPressed;

  const AlarmButton({
    required this.isAlarmOn,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(isAlarmOn ? 'Turn off Alarm' : 'Turn on Alarm'),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.black, // Set the button background color to black
      ),
    );
  }
}
