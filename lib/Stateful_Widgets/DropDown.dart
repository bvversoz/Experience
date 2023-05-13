import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropdownButton Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('DropdownButton Widget Demo'),
        ),
        body: Center(
          child: DropdownButtonWidget(),
        ),
      ),
    );
  }
}

class DropdownButtonWidget extends StatefulWidget {
  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String _selectedItem = 'Item 1';

  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  void _onSelectedItemChanged(String? value) {
    if (value != null) {
      setState(() {
        _selectedItem = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Selected Item: $_selectedItem',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        DropdownButton<String>(
          value: _selectedItem,
          onChanged: _onSelectedItemChanged,
          items: _items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}
