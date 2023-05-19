import 'package:flutter/material.dart';
import 'package:gsheets/Developer_Site/secondary_chips.dart';
import 'package:gsheets/Developer_Site/widgets/BottomNav/experience.dart';
import 'package:gsheets/Developer_Site/widgets/BottomNav/projects.dart';
import 'package:gsheets/Developer_Site/widgets/BottomNav/resume.dart';
import 'package:gsheets/Developer_Site/widgets/BottomNav/skills.dart';
import 'package:gsheets/Developer_Site/widgets/circle_avatar.dart';
import 'package:gsheets/Developer_Site/widgets/contact_me.dart';
import 'package:gsheets/Developer_Site/widgets/image_widget.dart';
import 'package:gsheets/Developer_Site/widgets/top_chips.dart';

class DeveloperBody extends StatefulWidget {
  @override
  _DeveloperBodyState createState() => _DeveloperBodyState();
}

class _DeveloperBodyState extends State<DeveloperBody> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Column(
      children: [
        SizedBox(height: 60),
        CircleAvatarWidget(),
        SizedBox(height: 20),
        Text('Ben Versoza'),

        ImageWidgetCincinnati(),
        SizedBox(height: 20),  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(width: 30, height: 30, child: Image.asset('facebook.png')),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(width: 30, height: 30, child: Image.asset('instagram.png')),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(width: 30, height: 30, child: Image.asset('twitter.png')),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(width: 30, height: 30, child: Image.asset('linkedin.png')),
            ),
          ],
        ),


        SizedBox(height: 20,),
        ContactMe(),
      ],
    ),
    SkillsSection(),
    ExperienceSection(),
    ProjectsSection(),
    ResumeSection(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.code),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            IconButton(
              icon: Icon(Icons.work),
              onPressed: () {
                _onItemTapped(2);
              },
            ),
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () {
                _onItemTapped(3);
              },
            ),
            IconButton(
              icon: Icon(Icons.description),
              onPressed: () {
                _onItemTapped(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
