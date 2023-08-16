// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:salat_w_azkar_elmuslim/models/copy_button.dart';
import 'package:salat_w_azkar_elmuslim/models/custom_divider.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  const CustomContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                  CopyButton(title),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          title,
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
                      // const CustomDivider(),
                      Stack(
                        children: [
                          // The Container
                          Container(
                            height: 2,
                            width: 300,
                            color: const Color(0xff1E5A83),
                          ),

                          const Positioned(
                            top: 10,
                            left: (300 - 54) / 2,
                            child: CircleAvatar(
                              backgroundColor: Color(0xff1E5A83),
                              radius: 27,
                              child: Text(
                                '3',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
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
