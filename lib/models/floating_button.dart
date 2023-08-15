import 'package:flutter/material.dart';

class CustomResetButton extends StatefulWidget {
  const CustomResetButton({Key? key}) : super(key: key);

  @override
  State<CustomResetButton> createState() => _CustomResetButtonState();
}

class _CustomResetButtonState extends State<CustomResetButton> {
  int counter = 0;
  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        resetCounter();
      },
      label: const Text(
        'البدء من جديد',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: const Icon(Icons.restore),
      backgroundColor: const Color(0xff1E5A83),
    );
  }
}
