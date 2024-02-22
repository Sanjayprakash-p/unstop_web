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
                child: textformfield(
                  prefixiicon: Icon(Icons.title),
                  //  SizedBox(
                  //   width: 20,
                  //   height: 20,
                  //   child: Image.asset('assets/titleicon.png'),
                  // ),
                  hinttext: 'Title',
                ),
              ),
              Gap(20),
              SizedBox(
                width: 400,
                child: textformfield(
                  prefixiicon: Icon(Icons.subtitles),
                  //  SizedBox(
                  //   width: 20,
                  //   height: 20,
                  //   child: Image.asset('assets/titleicon.png'),
                  // ),
                  hinttext: 'Sub title',
                ),
              ),
              Gap(20),
              SizedBox(
                width: 400,
                child: textformfield(
                  prefixiicon: Icon(Icons.domain_add_outlined),
                  //  SizedBox(
                  //   width: 20,
                  //   height: 20,
                  //   child: Image.asset('assets/titleicon.png'),
                  // ),
                  hinttext: 'Domain',
                ),
              ),
              Gap(20),
              SizedBox(
                width: 400,
                child: textformfield(
                  prefixiicon: Icon(Icons.interests_outlined),
                  //  SizedBox(
                  //   width: 20,
                  //   height: 20,
                  //   child: Image.asset('assets/titleicon.png'),
                  // ),
                  hinttext: 'Aera of intrest',
                ),
              ),
              Gap(20),
              SizedBox(
                width: 400,
                child: textformfield(
                  prefixiicon: Icon(Icons.title),
                  //  SizedBox(
                  //   width: 20,
                  //   height: 20,
                  //   child: Image.asset('assets/titleicon.png'),
                  // ),
                  hinttext: 'Github link',
                ),
              ),
              Gap(20),
              TextFormField(
                maxLines: 3,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon:
                      // SizedBox(
                      //   width: 30,
                      //   height: 40,
                      //   child:
                      Icon(
                    Icons.ac_unit,
                  ),
                  // Image.asset('assets/titleicon.png')
                  // ),
                  //  const Icon(
                  //   Icons.person_outline_outlined,
                  //   color: Colors.white,
                  // ),
                  constraints: const BoxConstraints(maxWidth: 600),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 25.0),
                  hintText: 'Description',
                  //  'Title',
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
                  fillColor: Colors.grey.withOpacity(0.60), // Background color
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
              Gap(20),
              SizedBox(
                width: 400,
                child: textformfield(
                  prefixiicon: Icon(Icons.abc_sharp),
                  //  SizedBox(
                  //   width: 20,
                  //   height: 20,
                  //   child: Image.asset('assets/titleicon.png'),
                  // ),
                  hinttext: 'Project level',
                ),
              ),
              Text('Required skills'),
            ],
          ),
        ),
      ),
    );
  }
}

class textformfield extends StatefulWidget {
  textformfield({super.key, required this.prefixiicon, required this.hinttext});
  final Widget prefixiicon;

  final String hinttext;

  @override
  State<textformfield> createState() => _textformfieldState();
}

class _textformfieldState extends State<textformfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon:
            // SizedBox(
            //   width: 30,
            //   height: 40,
            //   child:
            widget.prefixiicon,
        // Image.asset('assets/titleicon.png')
        // ),
        //  const Icon(
        //   Icons.person_outline_outlined,
        //   color: Colors.white,
        // ),
        constraints: const BoxConstraints(maxWidth: 600),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
        hintText: widget.hinttext,
        //  'Title',
        hintStyle: const TextStyle(fontSize: 17.0, color: Colors.white),
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
        fillColor: Colors.grey.withOpacity(0.60), // Background color
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
    );
  }
}
