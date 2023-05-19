
import 'package:flutter/material.dart';


class CircleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80,
      backgroundImage: AssetImage('ben.png'),
    );
  }
}
