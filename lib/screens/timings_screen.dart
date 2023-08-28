// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_cubit.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_states.dart';
import 'package:salat_w_azkar_elmuslim/Widgets/widgets.dart';
import 'package:salat_w_azkar_elmuslim/screens/settings_screen.dart';
import 'package:intl/intl.dart';

import '../core/colors.dart';
import '../core/functions.dart';

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
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (appCubit.errorStatus)
                          Image.asset(
                            'assets/404.gif',
                            width: 405,
                            height: 370,
                          ),
                        const Text(
                          "تأكد من الاتصال بالإنترنت \n وتفعيل الموقع",
                          textAlign: TextAlign.center,
                        ),
                      ],
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
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
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
                                              height: 25,
                                            ),
                                            //location
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  appCubit.address?.locality
                                                          .toString() ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0)),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  size: 30,
                                                ),
                                              ],
                                            ),
                                            //location
                                            Text(
                                              appCubit.address == null
                                                  ? ''
                                                  : '${appCubit.address!.administrativeArea}, ${appCubit.address!.country}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),

                                            Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '  ${appCubit.timesModel!.data.date.readable} : آخر تحديث',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 23,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            //times
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFFFFFFFF)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 1.0),
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
                                  FontAwesomeIcons.gear,
                                  color: Color.fromARGB(255, 0, 0, 0),
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
