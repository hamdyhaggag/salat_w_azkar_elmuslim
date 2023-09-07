import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:salat_w_azkar_elmuslim/constants/colors.dart';

import '../../../constants/app_text.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_folder_row.dart';
import '../../Widgets/row_with_text_and_icon.dart';
import '../../Widgets/widgets.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  _SettingsScreensState createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  TimeOfDay? selectedTimeMorning;
  TimeOfDay? selectedTimeEvening;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'الإعدادات'),
      body: Column(
        children: <Widget>[
          SizedBox(height: 7.h),

          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const RowWithTextAndIcon(
              'الشاشة الرئيسية',
              FontAwesomeIcons.house,
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),

          InkWell(
            onTap: () {
              showMethods(context);
            },
            child: const RowWithTextAndIcon(
              'طريقة تحديد مواقيت الصلاة',
              Icons.timer,
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),

          ///////////////////////
          InkWell(
            onTap: () async {
              final pickedTime = await showTimePicker(
                context: context,
                initialTime: selectedTimeMorning ?? TimeOfDay.now(),
              );

              if (pickedTime != null) {
                setState(() {
                  selectedTimeMorning = pickedTime;
                });

                // Save the selected time in a variable or in your app state for morning.
                // Example: scheduleLocalNotification(selectedTimeMorning);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  selectedTimeMorning != null
                      ? DateFormat('hh:mm a').format(
                          DateTime(
                            0,
                            1,
                            1,
                            selectedTimeMorning!.hour,
                            selectedTimeMorning!.minute,
                          ),
                        )
                      : ' اختر توقيتاً',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
                SizedBox(
                  width: 125.w,
                ),
                const RowWithTextAndIcon(
                  'التنبية لأذكار الصباح',
                  Icons.sunny,
                ),
              ],
            ),
          ),
          SizedBox(height: 7.0.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () async {
              final pickedTime = await showTimePicker(
                context: context,
                initialTime: selectedTimeEvening ?? TimeOfDay.now(),
              );

              if (pickedTime != null) {
                setState(() {
                  selectedTimeEvening = pickedTime;
                });

                // Save the selected time in a variable or in your app state for evening.
                // Example: scheduleLocalNotification(selectedTimeEvening);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  selectedTimeEvening != null
                      ? DateFormat('hh:mm a').format(
                          DateTime(
                            0,
                            1,
                            1,
                            selectedTimeEvening!.hour,
                            selectedTimeEvening!.minute,
                          ),
                        )
                      : ' اختر توقيتاً',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
                SizedBox(
                  width: 117.w,
                ),
                const RowWithTextAndIcon(
                  'التنبية لأذكار المساء',
                  Icons.dark_mode,
                ),
              ],
            ),
          ),
          SizedBox(height: 7.0.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          //////////////////////////////////////

          InkWell(
            onTap: () {
              showappinfo(context);
            },
            child: const RowWithTextAndIcon(
              'معلومات عن التطبيق',
              Icons.info,
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              showprivacy(context);
            },
            child: const RowWithTextAndIcon(
              'سياسة الخصوصية',
              Icons.privacy_tip_rounded,
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              sendEmail();
            },
            child: const RowWithTextAndIcon(
              'تواصل معنا',
              Icons.mail_rounded,
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              Donate(context);
            },
            child: const RowWithTextAndIcon(
              'ادعمنا',
              FontAwesomeIcons.circleDollarToSlot,
            ),
          ),
          SizedBox(height: 10.0.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              shareFeedback(context);
            },
            child: const RowWithTextAndIcon(
              'تقييم التطبيق',
              Icons.star,
            ),
          ),
          SizedBox(height: 10.0.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              shareOptions(context);
            },
            child: const RowWithTextAndIcon(
              'شارك التطبيق',
              Icons.share,
            ),
          ),
          SizedBox(height: 10.0.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),

          // InkWell(
          //   onTap: () {
          //     // Handle the tap event here
          //     // You can toggle the Switch's state or perform any other action
          //   },
          //   child: Row(
          //     children: [
          //       Flexible(
          //         flex: 1,
          //         child: Container(), // Adjust the flex value as needed
          //         // Replace with any content you want before the Switch
          //       ),
          //       Switch(
          //         value: true, // Replace with the actual boolean value
          //         onChanged: (newValue) {
          //           // Update the switch's state when it's toggled
          //           // You can also perform any additional actions here
          //         },
          //       ),
          //       const Flexible(
          //         flex: 14, // Adjust the flex value as needed
          //         child: RowWithTextAndIcon(
          //           'إشعار يوم الجمعة',
          //           Icons.notifications_active_rounded,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 10.0),
          // Container(
          //   height: 2,
          //   width: 420,
          //   color: colorWithOpacity,
          // ),
        ],
      ),
    );
  }
}
