import 'package:flutter/material.dart';

class MarkdownStyles {
  TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  TextStyle heading3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey,
    decoration: TextDecoration.underline,
  );


  TextStyle heading4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  TextStyle bold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  TextStyle italic = TextStyle(
    fontStyle: FontStyle.italic,
  );

  TextStyle link = TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  TextStyle list = TextStyle(
    fontSize: 16,
  );

  TextStyle code = TextStyle(
    fontFamily: 'Courier',
    backgroundColor: Colors.grey[300],
    fontSize: 14,
  );
}
