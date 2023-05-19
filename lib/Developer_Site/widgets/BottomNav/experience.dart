import 'package:flutter/material.dart';
import 'package:gsheets/Developer_Site/widgets/BottomNav/resume_styling_classes.dart';

import '../top_chips.dart';

class ExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Text('Experience Section', style: MarkdownStyles().heading1,),
        SizedBox(height: 50,),
        TopChipsWidget(),
      ],
    );
  }
}
