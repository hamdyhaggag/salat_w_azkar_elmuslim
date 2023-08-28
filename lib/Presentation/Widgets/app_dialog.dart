import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    widget.content,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
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
                          height: 30,
                          alignment: Alignment.center,
                          child: Text(
                            widget.cancelAction.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
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
                          height: 30,
                          alignment: Alignment.center,
                          child: Text(
                            widget.okAction.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
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
