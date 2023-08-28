import 'package:flutter/cupertino.dart';
import '../../../constants/colors.dart';

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
