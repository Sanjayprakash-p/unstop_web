import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD29jo1rQXmU0FPpHZ4wcVgCjs-jvt1KLc",
          authDomain: "unstop-910ca.firebaseapp.com",
          projectId: "unstop-910ca",
          storageBucket: "unstop-910ca.appspot.com",
          messagingSenderId: "1007615259062",
          appId: "1:1007615259062:web:d634c6d4fb15b2a94fd117"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // themeMode: ThemeMode.light,

      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.brown, brightness: Brightness.light)),
      title: 'Navigation Example',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const UserRegistrationScreen()),
        GetPage(name: '/MyWidget', page: () => const MyWidget()),
      ],
      // home: const UserRegistrationScreen(),
    );
  }
}

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({Key? key}) : super(key: key);

  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _password;

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Add user data to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': _name,
        'email': _email,
      });

      // Navigate to profile management screen
      Get.offNamed('/ProfileManagementScreen');
    } catch (e) {
      print('Error: $e');
      // Handle registration errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage('1.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   title: const Row(
        //     children: [
        //       Text(
        //         'LOGO',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ],
        //   ),
        //   backgroundColor: Colors.transparent,
        // ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outline_outlined,
                        color: Colors.white,
                      ),
                      constraints: const BoxConstraints(maxWidth: 600),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 25.0),
                      hintText: 'Name',

                      hintStyle:
                          const TextStyle(fontSize: 17.0, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      // filled: true,
                      // fillColor: Colors.white, // Background color
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Colors.red), // Error border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Colors.transparent), // Focused border color
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none, // Default border color
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none, // Disabled border color
                      ),
                      filled: true,
                      fillColor:
                          Colors.white.withOpacity(0.40), // Background color
                      errorStyle:
                          const TextStyle(fontSize: 14.0), // Error text style
                      // Add other properties as needed
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _name = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      constraints: const BoxConstraints(maxWidth: 600),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 25.0),
                      hintText: 'Email',
                      hintStyle:
                          const TextStyle(fontSize: 17.0, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      // filled: true,
                      // fillColor: Colors.white, // Background color
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Colors.red), // Error border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Colors.transparent), // Focused border color
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none, // Default border color
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none, // Disabled border color
                      ),
                      filled: true,
                      fillColor:
                          Colors.white.withOpacity(0.30), // Background color
                      errorStyle:
                          const TextStyle(fontSize: 14.0), // Error text style
                      // Add other properties as needed
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: Colors.white,
                      ),
                      constraints: const BoxConstraints(maxWidth: 600),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 25.0),
                      hintText: 'Password',
                      hintStyle:
                          const TextStyle(fontSize: 17.0, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      // filled: true,
                      // fillColor: Colors.white, // Background color
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Colors.red), // Error border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Colors.transparent), // Focused border color
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none, // Default border color
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none, // Disabled border color
                      ),
                      filled: true,
                      fillColor:
                          Colors.white.withOpacity(0.30), // Background color
                      errorStyle:
                          const TextStyle(fontSize: 14.0), // Error text style
                      // Add other properties as needed
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        minimumSize: const Size(600, 50)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _register();
                      }
                      // Get.toNamed('/MyWidget');
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              // backgroundColor: Colors.white
                              textStyle: const TextStyle(color: Colors.white)),
                          onPressed: () {},
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                letterSpacing: 0.85,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileManagementScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProfileManagementScreen({Key? key}) : super(key: key);

  Future<void> _signOut() async {
    await _auth.signOut();
    // Navigate to login or registration screen
    // Example: Get.offAllNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => _signOut(),
          ),
        ],
      ),
      body: const Center(
        child: Text('Profile Management Screen'),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('hello'),
      ),
    );
  }
}
