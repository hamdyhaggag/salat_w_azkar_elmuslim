// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/SettingsScreen/settings_screen.dart';
import 'package:intl/intl.dart';

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
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);

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

        return Scaffold(
            backgroundColor: Colors.white,
            body: appCubit.errorStatus == true
                ? RefreshIndicator(
                    onRefresh: () async {
                      appCubit.getMyCurrentLocation();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (appCubit.errorStatus)
                            Image.asset(
                              'assets/404.gif',
                              width: MediaQuery.of(context).size.width * 2,
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                          const Text(
                            "تأكد من الاتصال بالإنترنت \n وتفعيل الموقع",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                : appCubit.timesModel == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RefreshIndicator(
                            onRefresh: () async {
                              appCubit.getMyCurrentLocation();
                            },
                            child: const SingleChildScrollView(
                                child: Center(
                              child: CircularProgressIndicator(),
                            )),
                          ),
                        ],
                      )
                    : SafeArea(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            RefreshIndicator(
                              onRefresh: () async {
                                appCubit.getMyCurrentLocation();
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Image.asset(
                                        'assets/mousq.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(top: 300),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 27,
                                            ),
                                            //location
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AppText(
                                                  appCubit.address?.locality
                                                          .toString() ??
                                                      '',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54,
                                                  fontSize: 24,
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.black54,
                                                  size: 28,
                                                ),
                                              ],
                                            ),
                                            //location
                                            AppText(
                                              appCubit.address == null
                                                  ? ''
                                                  : '${appCubit.address!.administrativeArea}, ${appCubit.address!.country}',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              fontSize: 24,
                                            ),

                                            Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 1,
                                                      horizontal: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          '  ${appCubit.timesModel!.data.date.readable} : آخر تحديث',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 23,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                            //times
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFFFFFFFF)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 3.0),
                                                child: Column(
                                                  children: [
                                                    prayTimeRow(
                                                        en: 'Fajr',
                                                        time: formatPrayTime(
                                                            appCubit
                                                                .timesModel!
                                                                .data
                                                                .timings
                                                                .fajr),
                                                        ar: 'الفجر'),
                                                    const SizedBox(height: 10),
                                                    prayTimeRow(
                                                        en: 'Sunrise',
                                                        time: formatPrayTime(
                                                            appCubit
                                                                .timesModel!
                                                                .data
                                                                .timings
                                                                .sunrise),
                                                        ar: 'الشروق'),
                                                    const SizedBox(height: 10),
                                                    prayTimeRow(
                                                        en: 'Dhuhr',
                                                        time: formatPrayTime(
                                                            appCubit
                                                                .timesModel!
                                                                .data
                                                                .timings
                                                                .dhuhr),
                                                        ar: 'الظهر'),
                                                    const SizedBox(height: 10),
                                                    prayTimeRow(
                                                        en: 'Asr',
                                                        time: formatPrayTime(
                                                            appCubit
                                                                .timesModel!
                                                                .data
                                                                .timings
                                                                .asr),
                                                        ar: 'العصر'),
                                                    const SizedBox(height: 10),
                                                    prayTimeRow(
                                                        en: 'Maghrib',
                                                        time: formatPrayTime(
                                                            appCubit
                                                                .timesModel!
                                                                .data
                                                                .timings
                                                                .maghrib),
                                                        ar: 'المغرب'),
                                                    const SizedBox(height: 10),
                                                    prayTimeRow(
                                                        en: 'Isha',
                                                        time: formatPrayTime(
                                                            appCubit
                                                                .timesModel!
                                                                .data
                                                                .timings
                                                                .isha),
                                                        ar: 'العشاء'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                navigateTo(context, const SettingsScreens());
                              },
                              icon: const Padding(
                                padding: EdgeInsets.only(right: 35, top: 10),
                                child: Icon(
                                  FontAwesomeIcons.bars,
                                  color: Colors.black54,
                                  size: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
      },
    );
  }
}
