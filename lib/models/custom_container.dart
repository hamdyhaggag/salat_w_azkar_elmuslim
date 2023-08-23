import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/core/colors.dart';
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
              color: AppColors.primaryColor,
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
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.primaryColor,
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
                            color: AppColors.primaryColor,
                          ),
                          Positioned(
                            top: 10,
                            left: (300 - 54) / 2,
                            child: CircleAvatar(
                              backgroundColor: showCheckIcon
                                  ? AppColors.primaryColor
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
                        style: TextStyle(
                          color: AppColors.primaryColor,
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
