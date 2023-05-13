// import 'package:flutter/material.dart';
//
// class HideButton extends StatefulWidget {
//   final bool isVisible;
//
//   const HideButton({
//     required this.isVisible,
//   });
//
//   @override
//   _HideButtonState createState() => _HideButtonState();
// }
//
// class _HideButtonState extends State<HideButton> {
//   bool _isHidden = true;
//
//   void _toggleVisibility() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text(_isHidden ? 'Show' : 'Hide'),
//       onPressed: _toggleVisibility,
//       style: ElevatedButton.styleFrom(
//         primary: widget.isVisible ? Colors.blue : Colors.grey,
//       ),
//     );
//   }
// }
