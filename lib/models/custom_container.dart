import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/models/copy_button.dart';

class CustomContainer extends StatelessWidget {
  final String title;

  const CustomContainer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
