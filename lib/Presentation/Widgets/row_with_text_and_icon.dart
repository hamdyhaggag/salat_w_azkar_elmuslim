import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/colors.dart';
import '../../constants/app_text.dart';

class RowWithTextAndIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget? widget;
  final void Function()? onTap;

  const RowWithTextAndIcon(
    this.text,
    this.icon, {
    super.key,
    this.widget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AppText(text,
              fontSize: 19,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor),
          SizedBox(
            width: 20.w,
          ),
          Icon(
            icon,
            color: AppColors.primaryColor,
          ),
          SizedBox(width: 16.0.w),
        ],
      ),
    );
  }
}
