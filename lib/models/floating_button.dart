import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
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
