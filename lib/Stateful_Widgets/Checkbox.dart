import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Checkbox Widget Demo'),
        ),
        body: Center(
          child: CheckboxWidget(),
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    if (value != null) {
      setState(() {
        _isChecked = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: _toggleCheckbox,
        ),

        Text(
          'Checkbox is ${_isChecked ? 'checked' : 'unchecked'}',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
