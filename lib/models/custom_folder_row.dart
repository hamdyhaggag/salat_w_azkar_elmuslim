// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w500,
                color: Color(0xff1E5A83),
              ),
            ),
            const SizedBox(
              width: 22,
            ),
            const Icon(
              FontAwesomeIcons.fileLines,
              color: Color(0xff1E5A83),
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

Color colorWithOpacity = const Color(0xff1E5A83).withOpacity(0.2);
