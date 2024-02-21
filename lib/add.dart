import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Add_page extends StatefulWidget {
  const Add_page({super.key});

  @override
  State<Add_page> createState() => _Add_pageState();
}

class _Add_pageState extends State<Add_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Center(child: Text('Add Page')),
              Gap(20),
              SizedBox(
                width: 400,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                        width: 30,
                        height: 40,
                        child: Image.asset('assets/titleicon.png')),
                    //  const Icon(
                    //   Icons.person_outline_outlined,
                    //   color: Colors.white,
                    // ),
                    constraints: const BoxConstraints(maxWidth: 600),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 25.0),
                    hintText: 'Title',
                    hintStyle:
                        const TextStyle(fontSize: 17.0, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor:
                        Colors.grey.withOpacity(0.60), // Background color
                    errorStyle: const TextStyle(fontSize: 14.0),
                  ),

                  // Validation for text form//

                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your name';
                  //   }
                  //   return null;
                  // },
                  // onChanged: (value) {
                  //   _name = value;
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
