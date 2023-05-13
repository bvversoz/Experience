
import 'package:flutter/material.dart';



class CustomElevatedButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    required this.text,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}
