import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/colors.dart';
import '../../constants/app_text.dart';

class AppDialog extends StatefulWidget {
  const AppDialog({
    Key? key,
    required this.content,
    required this.okAction,
    required this.cancelAction,
  }) : super(key: key);

  final String content;
  final AppDialogAction okAction;
  final AppDialogAction cancelAction;

  static Future<void> showAppDialog({
    required BuildContext context,
    required String content,
    required AppDialogAction okAction,
    required AppDialogAction cancelAction,
  }) async {
    return showDialog(
      context: context,
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.5,
          sigmaY: 2.5,
        ),
        child: AppDialog(
          content: content,
          okAction: okAction,
          cancelAction: cancelAction,
        ),
      ),
    );
  }

  @override
  State<AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 220,
      ),
    );
    scaleAnimation = controller.view;
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: WillPopScope(
        onWillPop: () async {
          await controller.reverse();
          return Future.value(true);
        },
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                  child: AppText(
                    widget.content,
                    fontSize: 21,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.blackColor,
                          backgroundColor: AppColors.whiteColor,
                          side: BorderSide(
                              color: AppColors.primaryColor), // Border color
                        ),
                        onPressed: widget.cancelAction.onTap,
                        child: Container(
                          height: 50.h,
                          alignment: Alignment.center,
                          child: AppText(
                            widget.cancelAction.title,
                            fontSize: 19,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.blackColor,
                          backgroundColor: AppColors.whiteColor,
                          side: BorderSide(
                              color: AppColors.primaryColor), // Border color
                        ),
                        onPressed: widget.okAction.onTap,
                        child: Container(
                          height: 50.h,
                          alignment: Alignment.center,
                          child: AppText(
                            widget.okAction.title,
                            fontFamily: 'Cairo',
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppDialogAction {
  final String title;
  final VoidCallback onTap;

  AppDialogAction({
    required this.title,
    required this.onTap,
  });
}
