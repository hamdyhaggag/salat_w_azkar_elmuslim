import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.verticalPadding,
    this.horizontalPadding,
  }) : super(key: key);
  final String title;
  final Function() onPressed;
  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 15,
        horizontal: horizontalPadding ?? 15,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: MaterialButton(
          color: AppColors.primaryColor,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
