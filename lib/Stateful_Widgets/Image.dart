import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  String _imageUrl =
      'https://images.pexels.com/photos/371986/pexels-photo-371986.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  bool _isLoading = true;

  void _reloadImage() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _isLoading
            ? CircularProgressIndicator()
            : Image.network(
          _imageUrl,
          height: 300,
          width: 300,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _reloadImage,
          child: Text('Reload Image'),
        ),
      ],
    );
  }
}
