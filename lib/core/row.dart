import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/models/circle_avatar.dart';

class MyCustomRow extends StatelessWidget {
  const MyCustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 3),
          child: Text(
            'تسبيحة',
            style: TextStyle(
              fontSize: 21,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  CircleAvatar(
                      backgroundColor: Color(0xff1E5A83),
                      radius: 27,
                      child: Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(
                          FontAwesomeIcons.infinity,
                          color: Colors.white,
                          size: 22,
                        ),
                      )),
                  SizedBox(
                    width: 12,
                  ),
                  CustomCircleAvatar(title: '1000'),
                  SizedBox(
                    width: 12,
                  ),
                  CustomCircleAvatar(title: '100'),
                  SizedBox(
                    width: 12,
                  ),
                  CustomCircleAvatar(title: '33'),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3, right: 19),
          child: Text(
            'ينتهي بعد',
            style: TextStyle(
              fontSize: 21,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
