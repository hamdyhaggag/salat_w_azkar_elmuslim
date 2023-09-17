import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tafakkur/Data/Web_Services/cache_helper.dart';
import 'package:tafakkur/main.dart';
import '../../../constants/app_text.dart';
import '../../../constants/colors.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_space.dart';
import '../../Widgets/row_with_text_and_icon.dart';
import '../../Widgets/widgets.dart';
import 'package:timezone/timezone.dart' as tz;

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  SettingsScreensState createState() => SettingsScreensState();
}

class SettingsScreensState extends State<SettingsScreens> {
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
          const CustomSpace(),
          InkWell(
            onTap: () {
              showMethods(context);
            },
            child: const RowWithTextAndIcon(
              'طريقة تحديد مواقيت الصلاة',
              Icons.timer,
            ),
          ),
          const CustomSpace(),
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
                CacheHelper.saveData(
                    key: 'Morning',
                    value:
                        "${selectedTimeMorning!.hour}:${selectedTimeMorning!.minute}");

                // Schedule a local notification for morning.
                scheduleLocalNotification(selectedTimeMorning!, 'أذكار الصباح',
                    'التنبية بأذكار الصباح');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: AppText(
                    selectedTimeMorning != null
                        ? DateFormat('hh:mma').format(
                            DateTime(
                              0,
                              1,
                              1,
                              selectedTimeMorning!.hour,
                              selectedTimeMorning!.minute,
                            ),
                          )
                        : 'اختر التوقيت',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDarkModee
                        ? const Color(0xff0c8ee1)
                        : AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const Flexible(
                  flex: 8,
                  child: RowWithTextAndIcon(
                    'التنبية لأذكار الصباح',
                    Icons.sunny,
                  ),
                ),
              ],
            ),
          ),
          const CustomSpace(),
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
                CacheHelper.saveData(
                    key: 'Evening',
                    value:
                        "${selectedTimeEvening!.hour}:${selectedTimeEvening!.minute}");
                // Schedule a local notification for evening.
                scheduleLocalNotification(selectedTimeEvening!, 'أذكار المساء',
                    'التنبية بأذكار المساء');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: AppText(
                    selectedTimeEvening != null
                        ? DateFormat('hh:mma ').format(
                            DateTime(
                              0,
                              1,
                              1,
                              selectedTimeEvening!.hour,
                              selectedTimeEvening!.minute,
                            ),
                          )
                        : 'اختر التوقيت',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDarkModee
                        ? const Color(0xff0c8ee1)
                        : AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const Flexible(
                  flex: 8,
                  child: RowWithTextAndIcon(
                    'التنبية لأذكار المساء',
                    Icons.dark_mode,
                  ),
                ),
              ],
            ),
          ),
          const CustomSpace(),
          Row(
            children: [
              Container(),
              Transform.scale(
                scale: 0.37,
                child: DayNightSwitch(
                  size: Size(120.w, 35.h),
                  value: isDarkMode,
                  sunColor: isDarkModee ? Colors.grey : AppColors.primaryColor,
                  moonColor: isDarkModee ? Colors.grey : AppColors.primaryColor,
                  dayColor: isDarkModee ? Colors.black26 : Colors.black26,
                  nightColor: isDarkModee ? Colors.black26 : Colors.black26,
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
                  'تفعيل الوضع الليلي',
                  Icons.wb_sunny_rounded,
                ),
              ),
            ],
          ),
          const CustomSpace(),
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
          const CustomSpace(),

          InkWell(
            onTap: () {
              showprivacy(context);
            },
            child: const RowWithTextAndIcon(
              'سياسة الخصوصية',
              Icons.privacy_tip_rounded,
            ),
          ),
          const CustomSpace(),

          InkWell(
            onTap: () {
              shareFeedback(context);
            },
            child: const RowWithTextAndIcon(
              'تقييم التطبيق',
              Icons.star,
            ),
          ),
          const CustomSpace(),

          InkWell(
            onTap: () {
              shareOptions(context);
            },
            child: const RowWithTextAndIcon(
              'شارك التطبيق',
              Icons.share,
            ),
          ),
          const CustomSpace(),

          InkWell(
            onTap: () {
              sendEmail();
            },
            child: const RowWithTextAndIcon(
              'تواصل معنا',
              Icons.mail_rounded,
            ),
          ),
          const CustomSpace(),

          InkWell(
            onTap: () {
              Donate(context);
            },
            child: const RowWithTextAndIcon(
              'ادعمنا',
              FontAwesomeIcons.circleDollarToSlot,
            ),
          ),
          const CustomSpace(),
        ],
      ),
    );
  }
}
