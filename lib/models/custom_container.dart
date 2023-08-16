import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/models/copy_button.dart';

import 'circle_progress.dart';

class CustomContainer extends StatefulWidget {
  final String title;

  const CustomContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  int counterValue = 3;
  bool showCheckIcon = false;

  final maxValue = 3;

  void decrementCounter() {
    if (counterValue > 0) {
      setState(() {
        counterValue--;
        if (counterValue == 0) {
          showCheckIcon = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: decrementCounter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xFF1E5A83),
            ),
          ),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CopyButton(widget.title),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: Color(0xFF1E5A83),
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 2,
                            width: 300,
                            color: const Color(0xff1E5A83),
                          ),
                          Positioned(
                            top: 10,
                            left: (300 - 54) / 2,
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 195, 205, 212),
                              radius: 27,
                              child: showCheckIcon
                                  ? const Icon(
                                      Icons.check,
                                      size: 30,
                                      color: Color(0xff1E5A83),
                                    )
                                  : Text(
                                      counterValue.toString(),
                                      style: const TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: (300 - 54) / 2,
                            child: CustomPaint(
                              painter: CircleProgressPainter(
                                progress: counterValue / maxValue,
                                showCheckIcon: showCheckIcon,
                              ),
                              child: SizedBox(
                                width: 54,
                                height: 54,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                      const Text(
                        'عدد التكرارات',
                        style: TextStyle(
                          color: Color(0xFF1E5A83),
                          fontSize: 25.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
