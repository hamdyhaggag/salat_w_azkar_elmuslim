// ignore_for_file: unused_import

import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/Data/Web_Services/cache_helper.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/SettingsScreen/settings_screen.dart';
import 'package:intl/intl.dart';
import 'package:salat_w_azkar_elmuslim/main.dart';
import '../../../constants/colors.dart';
import '../../Business_Logic/Cubit/app_cubit.dart';
import '../../Business_Logic/Cubit/app_states.dart';
import '../../Data/Web_Services/functions.dart';
import '../../constants/app_text.dart';
import '../Widgets/widgets.dart';

class TimingsScreen extends StatefulWidget {
  const TimingsScreen({Key? key}) : super(key: key);

  @override
  State<TimingsScreen> createState() => _TimingsScreenState();
}

class _TimingsScreenState extends State<TimingsScreen> {
  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User Granted Permission');
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      navigateTo(context, const TimingsScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is GetTimingsSuccess) {
          AppCubit.get(context).errorStatus = false;
        }
      },
      builder: (context, state) {
        var appCubit = AppCubit.get(context);

        return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  appCubit.getMyCurrentLocation();
                },
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: appCubit.errorStatus == true
                        ? Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (appCubit.errorStatus)
                                  Image.asset(
                                    'assets/404.gif',
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                  ),
                                AppText(
                                  "تأكد من الاتصال بالإنترنت \n و تفعيل الموقع",
                                  align: TextAlign.center,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                          )
                        : appCubit.timesModel == null
                            ? const CircularProgressIndicator()
                            : Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Column(
                                    children: [
                                      if (state is GetCurrentAddressLoading)
                                        const LinearProgressIndicator(),
                                      Stack(
                                        alignment:
                                            AlignmentDirectional.bottomEnd,
                                        children: [
                                          Image.asset(
                                            'assets/mousq.png',
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover,
                                          ),
                                          addressWidget(appCubit),
                                        ],
                                      ),
                                      timesWidget(appCubit),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      navigateTo(
                                          context, const SettingsScreens());
                                    },
                                    icon: Padding(
                                      padding: EdgeInsets.only(
                                          right: 35.w, top: 10.h),
                                      child: const Icon(
                                        FontAwesomeIcons.bars,
                                        color: Colors.black54,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget addressWidget(AppCubit appCubit) {
    final String administrativeArea =
        CacheHelper.getString(key: "administrativeArea");
    final String country = CacheHelper.getString(key: "country");
    final String locality = CacheHelper.getString(key: "locality");

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              appCubit.address == null
                  ? locality
                  : appCubit.address!.locality.toString(),
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 21,
            ),
            SizedBox(
              width: 12.w,
            ),
            const Icon(
              Icons.location_on,
              color: Colors.black54,
              size: 28,
            ),
          ],
        ),
        AppText(
          appCubit.address == null
              ? '$administrativeArea, $country'
              : '${appCubit.address!.administrativeArea}, ${appCubit.address!.country}',
          fontWeight: FontWeight.bold,
          color: Colors.black54,
          fontSize: 21,
        ),
      ],
    );
  }

  Widget timesWidget(AppCubit appCubit) {
    String formatPrayTime(String time) {
      DateTime now = DateTime.now();
      List<String> parts = time.split(':');

      final int hours = int.parse(parts[0]);
      final int minutes = int.parse(parts[1]);

      DateTime convertedDateTime =
          DateTime(now.year, now.month, now.day, hours, minutes);
      final formattedTime = DateFormat('hh:mm a').format(convertedDateTime);
      return formattedTime;
    }

    return Column(
      children: [
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                '  ${appCubit.timesModel!.data.date.readable} : آخر تحديث',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  fontFamily: 'Cairo',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Container(
          decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Column(
              children: [
                prayTimeRow(
                    en: 'Fajr',
                    time:
                        formatPrayTime(appCubit.timesModel!.data.timings.fajr),
                    ar: 'الفجر'),
                const SizedBox(height: 10),
                prayTimeRow(
                    en: 'Sunrise',
                    time: formatPrayTime(
                        appCubit.timesModel!.data.timings.sunrise),
                    ar: 'الشروق'),
                const SizedBox(height: 10),
                prayTimeRow(
                    en: 'Dhuhr',
                    time:
                        formatPrayTime(appCubit.timesModel!.data.timings.dhuhr),
                    ar: 'الظهر'),
                const SizedBox(height: 10),
                prayTimeRow(
                    en: 'Asr',
                    time: formatPrayTime(appCubit.timesModel!.data.timings.asr),
                    ar: 'العصر'),
                const SizedBox(height: 10),
                prayTimeRow(
                    en: 'Maghrib',
                    time: formatPrayTime(
                        appCubit.timesModel!.data.timings.maghrib),
                    ar: 'المغرب'),
                const SizedBox(height: 10),
                prayTimeRow(
                    en: 'Isha',
                    time:
                        formatPrayTime(appCubit.timesModel!.data.timings.isha),
                    ar: 'العشاء'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
