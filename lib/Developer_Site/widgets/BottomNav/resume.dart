import 'package:flutter/material.dart';
import 'package:gsheets/Developer_Site/widgets/BottomNav/resume_styling_classes.dart';

class ResumeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MarkdownStyles styles = MarkdownStyles();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Resume Section',
                  style: styles.heading1,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'BENJAMIN VERSOZA',
              style: styles.heading2,
            ),
            SizedBox(height: 10),
            Text(
              '1350 Bellpointe Commons',
            ),   Text(
              'Bellevue, KY, 41073',
            ),
            Text(
              'Email: benversoza@gmail.com',
            ),Text(
              'Phone: 513-470-4536',
            ),
            SizedBox(height: 20),
            Text(
              'Experience:',
              style: styles.bold,
            ),
            SizedBox(height: 10),
            Text(
              'LEAD QUALITY ASSURANCE SOFTWARE ENGINEER',
              style: styles.heading3,
            ),
            Text(
              'Pieces for Developers, Cincinnati, OH',
            ),
            Text(
              'October 2021 to Present',
            ),
            Text(
              '- Created and executed comprehensive test plans and cases, reducing post-release bugs and ensuring software functionality.',
              style: styles.list,
            ),
            Text(
              '- Oversaw product release cycle for 6 products, collaborating with cross-functional teams to improve software development and maintain quality.',
              style: styles.list,
            ),
            Text(
              '- Developed and maintained test automation frameworks to improve efficiency and reduce manual testing efforts, providing timely and accurate feedback to software developers to improve coding standards and practices.',
              style: styles.list,
            ),
            SizedBox(height: 10),
            Text(
              'OPERATIONS AREA MANAGER/SHIP DOCK SME',
              style: styles.heading3,
            ),
            Text(
              'Amazon Inc., Hebron, KY',
            ),
            Text(
              'September 2019 – October 2021',
            ),
            Text(
              '- Drove performance management of team members through coaching, recognition, and performance evaluations.',
              style: styles.list,
            ),
            Text(
              '- Executed daily labor plans to ensure seamless operations.',
              style: styles.list,
            ),
            Text(
              '- Led process improvement initiatives by deep diving large data sets using Amazon tools.',
              style: styles.list,
            ),
            Text(
              '- Major focus on reducing post-slam DEA misses by implementing trailer virtual physical audits for PA’s to complete SOS and EOS.',
              style: styles.list,
            ),
            SizedBox(height: 10),
            Text(
              'MARINE EXPORT FACILITY PRODUCTION SUPERVISOR',
              style: styles.heading3,
            ),
            Text(
              'Cargill Inc.',
            ),
            Text(
              'January 2019 – September 2019',
            ),
            Text(
              '- Vessel Stevedore: Oversaw a variety of Panamax corn, wheat, and soybean vessels.',
              style: styles.list,
            ),
            Text(
              '- Strategic planning and export of more than 400M Bushels of grain in record-breaking year.',
              style: styles.list,
            ),
            Text(
              '- Evaluated work-related factors to reduce variability and improve capacity of processes.',
              style: styles.list,
            ),
            Text(
              '- Champion of meeting strict deadlines to ensure on-time deliveries of cargo.',
              style: styles.list,
            ),
            SizedBox(height: 20),
            Text(
              'Skills:',
              style: styles.bold,
            ),
            SizedBox(height: 10),
            Text(
              'Quality Assurance, Cross-Functional Collaboration, Operations Management, Process Improvement, Inventory Management, Selenium Automation, Source Control and GitHub Processes.',
              style: styles.list,
            ),
            SizedBox(height: 20),
            Text(
              'Languages:',
              style: styles.bold,
            ),
            SizedBox(height: 10),
            Text(
              'DART, FLUTTER, MARKDOWN, SQL, VBA',
              style: styles.list,
            ),
            SizedBox(height: 20),
            Text(
              'Projects',
              style: styles.bold,
            ),
            SizedBox(height: 10),
            Text(
              'Pieces for Developers',
              style: styles.heading4,
            ),
            Text(
              '- Pieces Testing GitHub repository (includes processes across 6 production Applications)',
              style: styles.list,
            ),
            Text(
              '- Developed a comprehensive collection of Dart unit tests for company APIs.',
              style: styles.list,
            ),
            Text(
              '- Robust documentation of Internal APIs within Stoplight Studio.',
              style: styles.list,
            ),
            SizedBox(height: 10),
            Text(
              'Amazon Inc.',
              style: styles.heading4,
            ),
            Text(
              '- shake tables: Increased gaylord capacity by 30% which in turn contributed to better downstream trailer utilization.',
              style: styles.list,
            ),
            SizedBox(height: 10),
            Text(
              'Cargill Inc.',
              style: styles.heading4,
            ),
            Text(
              '- Stevedore Standard Work: Developed a breakdown of how to operate as a stevedore. Details step by step best practices from the time the ship docks and how to calculate ballasting/loading plan.',
              style: styles.list,
            ),
            SizedBox(height: 20),
            Text(
              'Education',
              style: styles.bold,
            ),
            SizedBox(height: 10),
            Text(
              'The Ohio State University, Columbus, OH',
              style: styles.heading4,
            ),
            Text(
              'College of Food, Agricultural, and Environmental Sciences',
              style: styles.list,
            ),
            Text(
              'Bachelor of Agribusiness, Minor in Communication Technology',
              style: styles.list,
            ),
            Text(
              'Graduated: December 2017',
              style: styles.list,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
