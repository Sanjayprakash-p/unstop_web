import 'package:flutter/material.dart';

class Response_layout extends StatelessWidget {
  const Response_layout({super.key, required this.mobile, required this.web});
  final Widget mobile;
  final Widget web;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 500) {
          return mobile;
        } else {
          return web;
        }
      },
    );
  }
}
