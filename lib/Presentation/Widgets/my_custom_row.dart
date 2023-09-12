import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_text.dart';
import 'circle_avatar.dart';

class MyCustomRow extends StatelessWidget {
  const MyCustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 3.w),
          child: AppText(
            'تسبيحة',
            fontSize: 14,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
        const Flexible(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCircleAvatar(),
              CustomCircleAvatar(title: '1000'),
              CustomCircleAvatar(title: '100'),
              CustomCircleAvatar(title: '33'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.w, right: 19.w),
          child: AppText(
            'نبهني بعد',
            fontSize: 14,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
