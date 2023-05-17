import 'package:flutter/material.dart';
import 'package:gsheets/Developer_Site/secondary_chips.dart';

void main() => runApp(DeveloperHome());

class DeveloperHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Home',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> topItems = [
    'Quality Assurance Testing',
    'Collaboration',
    'Operations Management',
    'Technical Skills',
    'Project Management',
    'Data Analysis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Developer Home'),
      // ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('ben.png'),
            ),
            SizedBox(height: 20),
            Text('Ben Versoza'),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                FittedBox(
                  child: Positioned.fill(
                    child: Image.asset(
                      'cincinnati.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Who Dey',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
            Container(
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
                    shadowColor: Colors.black,
                    label: Text(item),
                    backgroundColor: Colors.black12,
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            SecondaryChips(),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              child: Text(
                'Contact Me',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),



    );
  }
}
