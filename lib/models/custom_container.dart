import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/models/copy_button.dart';
import 'circle_progress.dart';

class CustomContainer extends StatefulWidget {
  final String title;
  final String? headtitle; // New parameter for optional text

  final int maxValue;
  final int initialCounterValue;

  const CustomContainer({
    Key? key,
    this.headtitle,
    required this.title,
    required this.maxValue,
    this.initialCounterValue = 0,
  }) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  late int counterValue;
  bool showCheckIcon = false;

  @override
  void initState() {
    super.initState();
    counterValue = widget.initialCounterValue;
  }

  void incrementCounter() {
    if (counterValue < widget.maxValue) {
      setState(() {
        counterValue++;
        if (counterValue == widget.maxValue) {
          showCheckIcon = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: incrementCounter, // Change to incrementCounter
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
                      if (widget.headtitle != null)
                        Text(
                          widget.headtitle!,
                          style: const TextStyle(
                              color: Color(0xFF1E5A83),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      SizedBox(
                        height: 12,
                      ),
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
                              backgroundColor: showCheckIcon
                                  ? const Color(0xff1E5A83)
                                  : const Color.fromARGB(255, 195, 205, 212),
                              radius: 27,
                              child: showCheckIcon
                                  ? const Icon(
                                      Icons.check,
                                      size: 30,
                                      color: Colors.white,
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
                                progress: counterValue / widget.maxValue,
                                showCheckIcon: showCheckIcon,
                              ),
                              child: const SizedBox(
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
                      Text(
                        ' ${widget.maxValue} : عدد التكرارات ',
                        style: const TextStyle(
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
