// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/core/colors.dart';

class CustomFolderRow extends StatelessWidget {
  const CustomFolderRow({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12, top: 12),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              width: 22,
            ),
            Icon(
              FontAwesomeIcons.fileLines,
              color: AppColors.primaryColor,
            )
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 2,
          width: 420,
          color: colorWithOpacity,
        ),
      ],
    );
  }
}

Color colorWithOpacity = AppColors.primaryColor.withOpacity(0.2);
