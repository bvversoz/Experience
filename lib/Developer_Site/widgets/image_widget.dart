import 'package:flutter/material.dart';

class ImageWidgetCincinnati extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Image.asset(
        'cincinnati.png',
        fit: BoxFit.scaleDown,

      ),
    );
  }
}
