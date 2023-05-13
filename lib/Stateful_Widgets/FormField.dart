import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({Key? key}) : super(key: key);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController _textController = TextEditingController();

  void _printInput() {
    print('Input: ${_textController.text}');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            labelText: 'Enter some text',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          child: Text('Print Input'),
          onPressed: _printInput,
        ),
      ],
    );
  }
}
