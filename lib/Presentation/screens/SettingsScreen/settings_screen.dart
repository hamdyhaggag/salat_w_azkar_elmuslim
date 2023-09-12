import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/colors.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_folder_row.dart';
import '../../Widgets/row_with_text_and_icon.dart';
import '../../Widgets/widgets.dart';
import 'package:timezone/timezone.dart' as tz;

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  SettingsScreensState createState() => SettingsScreensState();
}

class SettingsScreensState extends State<SettingsScreens> {
  TimeOfDay? selectedTimeMorning;
  TimeOfDay? selectedTimeEvening;

  Future<void> scheduleLocalNotification(
      TimeOfDay time, String title, String content) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    final now = DateTime.now();
    final notificationTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      content,
      tz.TZDateTime.from(notificationTime, tz.local),
      platformChannelSpecifics,
      // ignore: deprecated_member_use
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    final isDarkModee = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkModee ? const Color(0xff1F1F1F) : Colors.white,
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
          // InkWell(
          //   onTap: () async {
          //     final pickedTime = await showTimePicker(
          //       context: context,
          //       initialTime: selectedTimeMorning ?? TimeOfDay.now(),
          //     );
          //
          //     if (pickedTime != null) {
          //       setState(() {
          //         selectedTimeMorning = pickedTime;
          //       });
          //
          //       // Schedule a local notification for morning.
          //       scheduleLocalNotification(selectedTimeMorning!, 'أذكار الصباح',
          //           'التنبية بأذكار الصباح');
          //     }
          //   },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       AppText(
          //         selectedTimeMorning != null
          //             ? DateFormat('hh:mm a').format(
          //                 DateTime(
          //                   0,
          //                   1,
          //                   1,
          //                   selectedTimeMorning!.hour,
          //                   selectedTimeMorning!.minute,
          //                 ),
          //               )
          //             : 'اختر التوقيت',
          //         fontSize: 15,
          //         fontWeight: FontWeight.w700,
          //         color: AppColors.primaryColor,
          //         decoration: TextDecoration.underline,
          //       ),
          //       SizedBox(
          //         width: 98.w,
          //       ),
          //       const RowWithTextAndIcon(
          //         'التنبية لأذكار الصباح',
          //         Icons.sunny,
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 7.0.h),
          // Container(
          //   height: 2.h,
          //   width: 420.w,
          //   color: colorWithOpacity,
          // ),
          // InkWell(
          //   onTap: () async {
          //     final pickedTime = await showTimePicker(
          //       context: context,
          //       initialTime: selectedTimeEvening ?? TimeOfDay.now(),
          //     );
          //
          //     if (pickedTime != null) {
          //       setState(() {
          //         selectedTimeEvening = pickedTime;
          //       });
          //
          //       // Schedule a local notification for evening.
          //       scheduleLocalNotification(selectedTimeEvening!, 'أذكار المساء',
          //           'التنبية بأذكار المساء');
          //     }
          //   },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       AppText(
          //         selectedTimeEvening != null
          //             ? DateFormat('hh:mm a').format(
          //                 DateTime(
          //                   0,
          //                   1,
          //                   1,
          //                   selectedTimeEvening!.hour,
          //                   selectedTimeEvening!.minute,
          //                 ),
          //               )
          //             : 'اختر التوقيت',
          //         fontSize: 15,
          //         fontWeight: FontWeight.w700,
          //         color: AppColors.primaryColor,
          //         decoration: TextDecoration.underline,
          //       ),
          //       SizedBox(
          //         width: 90.w,
          //       ),
          //       const RowWithTextAndIcon(
          //         'التنبية لأذكار المساء',
          //         Icons.dark_mode,
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 7.0.h),
          // Container(
          //   height: 2.h,
          //   width: 420.w,
          //   color: colorWithOpacity,
          // ),
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

          Row(
            children: [
              Container(),
              Transform.scale(
                scale: 0.37,
                child: DayNightSwitch(
                  size: const Size(125, 45),
                  value: isDarkMode,
                  sunColor: Colors.amber,
                  moonColor: AppColors.primaryColor,
                  dayColor: AppColors.primaryColor,
                  nightColor: Color(0xff1F1F1F),
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
              ),
              const Flexible(
                flex: 14,
                child: RowWithTextAndIcon(
                  'الوضع الليلي',
                  Icons.wb_sunny_rounded,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0.h),
          Container(
            height: 2,
            width: 420,
            color: colorWithOpacity,
          ),
        ],
      ),
    );
  }
}
