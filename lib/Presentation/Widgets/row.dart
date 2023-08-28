import 'package:flutter/material.dart';

import 'circle_avatar.dart';

class MyCustomRow extends StatelessWidget {
  const MyCustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Padding(
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
        ),
        Expanded(
          flex: 3,
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
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 3, right: 19),
            child: Text(
              'نبهني بعد',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 21,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
