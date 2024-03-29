import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:unstop_web/add.dart';
import 'package:unstop_web/content.dart';
import 'package:unstop_web/user.dart';

class ProfileController extends GetxController {
  var profileImage = 'assets/profile_image.jpg'.obs;
  var profileName = 'John Doe'.obs;
  var profileTitle = 'Software Engineer'.obs;
  var profileDescription = 'Passionate about building great software.'.obs;
}

bool comment = false;
bool _showPostButton = false;

class Post {
  final String title;
  final String content;

  Post(this.title, this.content);
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

bool _showEmojiPicker = false;
TextEditingController emoji = TextEditingController();

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController profileController = Get.put(ProfileController());
  final TextEditingController _messageController = TextEditingController();

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
        title: const Text(
          'Connect',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Row(
        children: [
          // Card(
          //   margin: const EdgeInsets.all(16),
          //   elevation: 4,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Column(
          //       // crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Obx(
          //           () => CircleAvatar(
          //             radius: 50,
          //             backgroundImage:
          //                 AssetImage(profileController.profileImage.value),
          //           ),
          //         ),
          //         const SizedBox(height: 20),
          //         Obx(
          //           () => Text(
          //             profileController.profileName.value,
          //             style: const TextStyle(
          //                 fontSize: 24, fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //         const SizedBox(height: 10),
          //         Obx(
          //           () => Text(
          //             profileController.profileTitle.value,
          //             style: const TextStyle(fontSize: 18, color: Colors.grey),
          //           ),
          //         ),
          //         const SizedBox(height: 10),
          //         Obx(
          //           () => Text(
          //             profileController.profileDescription.value,
          //             textAlign: TextAlign.left,
          //             style: const TextStyle(fontSize: 16),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(child: user_Profile()),
          SizedBox(
            width: 600,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      profileController.profileImage.value),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _messageController,
                                    decoration: InputDecoration(
                                        errorBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        hintText: 'Type a message...',
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        focusedErrorBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(30))),
                                        fillColor: Colors.grey.shade100,
                                        filled: true),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //  Row(
                          //     // children: [Icon(Icons.media_bluetooth_off)],
                          //     )
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.all(8),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/1.jpg'),
                                      ),
                                      const Gap(10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            posts[index].title,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('@sampleuser'),
                                          const Text(
                                            '3d',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // const Expanded(child: Text('')),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: const Row(
                                            children: [
                                              Icon(Icons.add),
                                              Text('Join')
                                            ],
                                          )),
                                      const Gap(5),
                                      PopupMenuButton<String>(
                                        position: PopupMenuPosition.under,
                                        onSelected: (value) {
                                          if (value == 'copy_link') {
                                            // Implement copy link logic
                                          } else if (value == 'report_post') {
                                            // Implement report post logic
                                          } else if (value == 'inbox_chat') {
                                            // Navigate to chat screen
                                          }
                                        },
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: 'copy_link',
                                            child: Row(
                                              children: [
                                                Icon(Icons.content_copy,
                                                    color: Theme.of(context)
                                                        .iconTheme
                                                        .color),
                                                const SizedBox(width: 10),
                                                const Text('Copy Link'),
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 'report_post',
                                            child: Row(
                                              children: [
                                                Icon(Icons.flag,
                                                    color: Theme.of(context)
                                                        .iconTheme
                                                        .color),
                                                const SizedBox(width: 10),
                                                const Text('Report Post'),
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: 'inbox_chat',
                                            child: Row(
                                              children: [
                                                Icon(Icons.chat,
                                                    color: Theme.of(context)
                                                        .iconTheme
                                                        .color),
                                                const SizedBox(width: 10),
                                                const Text('Inbox Chat'),
                                              ],
                                            ),
                                          ),
                                        ],
                                        child: const IconButton(
                                          icon: Icon(Icons.more_vert_rounded),
                                          onPressed:
                                              null, // Remove onPressed as PopupMenu handles it
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                posts[index].content,
                                style: const TextStyle(fontSize: 16),
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
                              const Gap(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Row(
                                    children: [LikeButton(), Text(' Like')],
                                  ),
                                  const Gap(10),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        comment = !comment;
                                        if (!comment) _showEmojiPicker = false;
                                      });
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.comment_rounded),
                                        Text('Comment')
                                      ],
                                    ),
                                  ),
                                  const Gap(10),
                                  InkWell(
                                    onTap: () {},
                                    child: const Row(
                                      children: [
                                        Icon(Icons.share),
                                        Text('Share')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(5),
                              comment
                                  ? Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage:
                                              AssetImage('assets/1.jpg'),
                                        ),
                                        const Gap(10),
                                        Expanded(
                                          child: SizedBox(
                                            height: 50,
                                            child: TextField(
                                              controller: emoji,
                                              expands: false,
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _showEmojiPicker =
                                                          !_showEmojiPicker;
                                                    });
                                                  },
                                                  icon: const Icon(
                                                      Icons.emoji_emotions),
                                                ),
                                                hintText: 'Add a comment',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                ),
                                              ),
                                              onChanged: (text) {
                                                setState(() {
                                                  _showPostButton =
                                                      text.isNotEmpty;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: _showPostButton,
                                          child: TextButton(
                                            onPressed: () {
                                              // Implement your post logic here
                                            },
                                            child: const Text('Post'),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              _showEmojiPicker
                                  ? SizedBox(
                                      height: 250,
                                      child: EmojiPicker(
                                        onEmojiSelected: (category, emoj) {
                                          // Append the selected emoji to the text field
                                          emoji.text = emoji.text + emoj.emoji;
                                          setState(() {
                                            _showEmojiPicker = false;
                                          });
                                        },
                                      ),
                                    )
                                  : const SizedBox(),
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
          Expanded(child: ProjectsList())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Update profile data
          profileController.profileName.value = 'Jane Smith';
          profileController.profileTitle.value = 'UX Designer';
          profileController.profileDescription.value =
              'Passionate about creating intuitive user experiences.';
          profileController.profileImage.value = 'assets/images/raster/man.png';

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const Add_page())));
        },
        tooltip: 'Update Profile',
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

  bool _isFavorite = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        _controller.reverse().then((value) => _controller.forward());
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.7, end: 1.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
        child: _isFavorite
            ? const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red,
              )
            : const Icon(
                Icons.favorite_border,
                size: 30,
              ),
      ),
    );
  }
}
