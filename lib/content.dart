import 'package:flutter/material.dart';

class Project {
  String name;
  String details;
  DateTime date;
  List<String> skills; // Added skills field

  Project(this.name, this.details, this.date, this.skills);
}

class ProjectsList extends StatelessWidget {
  final List<Project> projects = [
    Project(
      'E-commerce App',
      'Develop a mobile application for buying and selling products online.',
      DateTime(2023, 5, 15),
      [
        'Flutter / React Native',
        'Dart / Java Script',
        'SQLite / Firebase',
        'UI/UX Design',
        'Payment Integration'
      ],
    ),
    Project(
      'Task Management System',
      'Create an app for managing tasks, to-dos, and deadlines.',
      DateTime(2023, 3, 20),
      [
        'Flutter / React Native',
        'Dart / Java Script',
        'SQLite / Firebase',
        'State Management',
        'Notifications'
      ],
    ),
    Project(
      'Social Media Dashboard',
      'Build a dashboard to manage social media accounts and schedule posts.',
      DateTime(2022, 12, 10),
      [
        'Flutter / React Native',
        'Dart / Java Script',
        'API Integration',
        'Data Visualization',
        'Responsive Design'
      ],
    ),
    Project(
      'Language Learning App',
      'Develop an app for learning new languages with interactive lessons.',
      DateTime(2023, 1, 5),
      [
        'Flutter / React Native',
        'Dart / Java Script',
        'Audio/Video Integration',
        'User Authentication',
        'Gamification'
      ],
    ),
    Project(
      'Event Planning App',
      'Create an app to plan and organize events, from invitations to logistics.',
      DateTime(2022, 8, 28),
      [
        'Flutter / React Native',
        'Dart / Java Script'
            'Google Maps API',
        'Calendar Integration',
        'User Feedback'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    projects.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Latest Projects:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: projects.map((project) {
                  return ProjectWidget(project);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final Project project;

  ProjectWidget(this.project);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(project),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                project.details,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Date: ${project.date.day}/${project.date.month}/${project.date.year}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Project project;

  DetailPage(this.project);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details for ${project.name}:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              project.details,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Date: ${project.date.day}/${project.date.month}/${project.date.year}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Skills:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: project.skills
                  .map((skill) => Text(
                        '- $skill',
                        style: TextStyle(fontSize: 16.0),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
