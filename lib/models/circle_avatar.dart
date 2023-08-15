import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String title;

  const CustomCircleAvatar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xff1E5A83),
      radius: 25,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
