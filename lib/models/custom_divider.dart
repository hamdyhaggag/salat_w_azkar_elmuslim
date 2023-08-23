// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/core/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
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
        Positioned(
          bottom: 22,
          left: 0,
          right: 0,
          child: Container(
            height: 2,
            width: 15,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
