import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var profileImage = 'assets/profile_image.jpg'.obs;
  var profileName = 'John Doe'.obs;
  var profileTitle = 'Software Engineer'.obs;
  var profileDescription = 'Passionate about building great software.'.obs;
}

class Post {
  final String title;
  final String content;

  Post(this.title, this.content);
}

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  final List<Post> posts = [
    Post('New Job Opportunity',
        'Exciting opportunity for software developers! Apply now and join our dynamic team.'),
    Post('Tips for Effective Communication',
        'Learn how to improve your communication skills and become a better communicator in both personal and professional settings.'),
    Post('Introduction to Flutter',
        'Discover the power of Flutter for building beautiful and fast cross-platform apps. Dive into the world of mobile development with Flutter today!'),
    Post('Productivity Hacks',
        'Boost your productivity with these simple yet effective productivity hacks. Learn how to manage your time better and get more done in less time.'),
    Post('Networking Event Tomorrow',
        'Don\'t miss our networking event tomorrow evening. Connect with professionals from various industries and expand your network.'),
    Post('Web Development Workshop',
        'Join us for a hands-on workshop on web development. Learn the latest web development technologies and build your own web projects.'),
    Post('Remote Work Challenges',
        'Discussing the challenges and solutions of remote work. Learn how to overcome common remote work challenges and thrive in a remote work environment.'),
    Post('Artificial Intelligence in Healthcare',
        'Exploring the role of AI in revolutionizing healthcare. Learn about the latest AI technologies and their applications in healthcare for better patient care and outcomes.'),
    Post('Financial Planning Tips',
        'Essential tips for managing your finances effectively. Get expert advice on budgeting, saving, investing, and achieving your financial goals.'),
    Post('Time Management Strategies',
        'Mastering time management for increased productivity. Discover proven time management strategies to help you prioritize tasks, avoid procrastination, and make the most of your time.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  margin: EdgeInsets.all(16),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                profileController.profileImage.value),
                          ),
                        ),
                        SizedBox(height: 20),
                        Obx(
                          () => Text(
                            profileController.profileName.value,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => Text(
                            profileController.profileTitle.value,
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(
                          () => Text(
                            profileController.profileDescription.value,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(8),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/1.jpg'),
                                ),
                                Gap(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      posts[index].title,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '3d',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              posts[index].content,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/1.jpg',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 15),
                            //   child: Divider(
                            //     color: Colors.black54,
                            //   ),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.thumb_up),
                                      onPressed: () {
                                        // Handle like button press
                                      },
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.mode_comment),
                                  onPressed: () {
                                    // Handle comment button press
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.share),
                                  onPressed: () {
                                    // Handle share button press
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Update profile data
          profileController.profileName.value = 'Jane Smith';
          profileController.profileTitle.value = 'UX Designer';
          profileController.profileDescription.value =
              'Passionate about creating intuitive user experiences.';
          profileController.profileImage.value = 'assets/images/raster/man.png';
        },
        tooltip: 'Update Profile',
        child: Icon(Icons.edit),
      ),
    );
  }
}
