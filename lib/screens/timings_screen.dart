// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_cubit.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_states.dart';
import 'package:salat_w_azkar_elmuslim/models/bottom_nav_bar.dart';
import 'package:salat_w_azkar_elmuslim/core/widgets.dart';
import 'package:salat_w_azkar_elmuslim/screens/settings_screen.dart';

import '../core/functions.dart';

class TimingsScreen extends StatelessWidget {
  const TimingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        navigateTo(context, const SettingsScreens());
                      },
                      icon: const Padding(
                        padding: EdgeInsets.only(right: 25, top: 5),
                        child: Icon(
                          FontAwesomeIcons.bars,
                          color: Color(0xff1E5A83),
                          size: 30,
                        ),
                      )),
                ],
              )
            ],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: BottomNavigationBar(
                selectedFontSize: 23,
                unselectedFontSize: 23,
                iconSize: 30,
                elevation: 100,
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                items: appCubit.bottomItems,
                currentIndex: appCubit.currentIndex,
                onTap: (index) {
                  appCubit.changeBottomNavBar(index, context);
                }),
          ),
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
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //location
                              Text(
                                appCubit.address!.locality.toString(),
                                style:
                                    const TextStyle(color: Color(0xff1E5A83)),
                              ),
                              const SizedBox(height: 10),
                              //location
                              Text(
                                '${appCubit.address!.administrativeArea}, ${appCubit.address!.country}',
                                style:
                                    const TextStyle(color: Color(0xff1E5A83)),
                              ),
                              const SizedBox(height: 15),
                              //date
                              Text(
                                appCubit.timesModel!.data.date.readable,
                                style: const TextStyle(
                                  color: Color(0xff1E5A83),
                                ),
                              ),
                              const SizedBox(height: 10),
                              //day
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    appCubit.timesModel!.data.date.gregorian
                                        .weekday.en,
                                    style: const TextStyle(
                                        color: Color(0xff1E5A83)),
                                  ),
                                  Text(
                                      appCubit.timesModel!.data.date.hijri
                                          .weekday.ar,
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                          color: Color(0xff1E5A83))),
                                ],
                              ),
                              const SizedBox(height: 20),
                              //times
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0),
                                  child: Column(
                                    children: [
                                      prayTimeRow(
                                          en: 'Fajr',
                                          time: appCubit
                                              .timesModel!.data.timings.fajr,
                                          ar: 'الفجر'),
                                      const SizedBox(height: 10),
                                      prayTimeRow(
                                          en: 'Sunrise',
                                          time: appCubit
                                              .timesModel!.data.timings.sunrise,
                                          ar: 'الشروق'),
                                      const SizedBox(height: 10),
                                      prayTimeRow(
                                          en: 'Dhuhr',
                                          time: appCubit
                                              .timesModel!.data.timings.dhuhr,
                                          ar: 'الظهر'),
                                      const SizedBox(height: 10),
                                      prayTimeRow(
                                          en: 'Asr',
                                          time: appCubit
                                              .timesModel!.data.timings.asr,
                                          ar: 'العصر'),
                                      const SizedBox(height: 10),
                                      prayTimeRow(
                                          en: 'Maghrib',
                                          time: appCubit
                                              .timesModel!.data.timings.maghrib,
                                          ar: 'المغرب'),
                                      const SizedBox(height: 10),
                                      prayTimeRow(
                                          en: 'Isha',
                                          time: appCubit
                                              .timesModel!.data.timings.isha,
                                          ar: 'العشاء'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
        );
      },
    );
  }
}
