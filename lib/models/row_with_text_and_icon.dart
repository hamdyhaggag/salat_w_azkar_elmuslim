import 'package:flutter/cupertino.dart';
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
            style: const TextStyle(
                fontSize: 27,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w500,
                color: Color(0xff1E5A83)),
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            icon,
            color: const Color(0xff1E5A83),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
