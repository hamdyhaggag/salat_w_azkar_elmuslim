import 'package:flutter/material.dart';

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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: CustomCircleAvatar(),
                  ),
                  CustomCircleAvatar(title: '1000'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: CustomCircleAvatar(title: '100'),
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
