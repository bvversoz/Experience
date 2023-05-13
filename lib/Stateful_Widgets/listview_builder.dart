import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Widget Demo'),
        ),
        body: Center(
          child: ListWidget(),
        ),
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  final TextEditingController _textController = TextEditingController();

  void _addNewItem() {
    final String newItem = _textController.text;
    setState(() {
      _items.add(newItem);
    });
    _textController.clear();
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
            labelText: 'Enter a new item',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          child: Text('Add Item'),
          onPressed: _addNewItem,
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_items[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
