import 'package:flutter/cupertino.dart';
import 'package:salat_w_azkar_elmuslim/core/colors.dart';
import 'package:salat_w_azkar_elmuslim/core/functions.dart';

class RowWithTextAndIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget? widget;

  const RowWithTextAndIcon(
    this.text,
    this.icon, {
    super.key,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, widget);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                fontSize: 27,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor),
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            icon,
            color: AppColors.primaryColor,
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
