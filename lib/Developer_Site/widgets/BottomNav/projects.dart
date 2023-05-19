import 'package:flutter/material.dart';

import '../../../Alarm_Clock/main.dart';
import '../../../sign_in_Home_Column.dart';

class ProjectsSection extends StatefulWidget {
  @override
  _ProjectsSectionState createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Alarm Clock'),
            Tab(text: 'Sign In'),
            Tab(text: 'Sample App 2'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              AlarmClockApp(),
              // Replace the placeholders below with the respective sample apps
              SignInForm(),
              Container(child: Text('Sample App 2')),
            ],
          ),
        ),
      ],
    );
  }
}
