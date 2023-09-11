// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../Data/Web_Services/functions.dart';
import '../../constants/app_text.dart';

Widget azkarButton({
  required String name,
  required Widget screeen,
  required BuildContext context,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.primaryColor,
            )),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: MaterialButton(
            color: Colors.white,
            highlightColor: const Color(0xff5d82a1),
            onPressed: () {
              navigateTo(context, screeen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AppText(
                name,
                color: AppColors.primaryColor,
                fontSize: 23.0,
              ),
            ),
          ),
        ),
      ),
    );
