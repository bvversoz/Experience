
import 'package:flutter/material.dart';

class TopChipsWidget extends StatelessWidget {
  final List<String> topItems = [
  'Quality Assurance Testing',
  'Collaboration',
  'Operations Management',
  'Technical Skills',
  'Project Management',
  'Dart'];


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 450,
        child: GridView.count(
          childAspectRatio: 4,
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: topItems.map((item) {
            return Chip(
              elevation: 4,
              shadowColor: Colors.white,
              label: Text(item),
              backgroundColor: Colors.black,
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
