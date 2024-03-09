import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class UserProfile {
  String name;
  String headline;
  String location;
  String connections;

  UserProfile(this.name, this.headline, this.location, this.connections);
}

class user_Profile extends StatelessWidget {
  final UserProfile user = UserProfile(
    'John Doe',
    'Flutter Developer',
    'San Francisco, CA',
    '500+ connections',
  );

  @override
  Widget build(BuildContext context) {
    return
        //  MaterialApp(
        //   home:
        Scaffold(
      // appBar: AppBar(
      //   title: Text('LinkedIn Profile'),
      // ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                    'https://example.com/path/to/your/profile/image.jpg'),
              ),
              SizedBox(height: 16.0),
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.headline,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                user.location,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                user.connections,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16.0),
              // Add more profile information here as needed
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
