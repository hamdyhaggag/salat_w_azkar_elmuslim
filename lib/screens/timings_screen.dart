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
import 'package:intl/intl.dart';

import '../core/functions.dart';

class TimingsScreen extends StatefulWidget {
  const TimingsScreen({Key? key}) : super(key: key);

  @override
  State<TimingsScreen> createState() => _TimingsScreenState();
}

class _TimingsScreenState extends State<TimingsScreen> {
  void refreshScreen() {
    setState(() {
      // Add the logic to update your screen here
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
// Get the current time
        final currentTime = DateTime.now();

// Format the current time as desired
        final formattedTime = DateFormat('hh:mm a')
            .format(currentTime); // Example format: 01:30 PM

        return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
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
                    : SafeArea(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SingleChildScrollView(
                              child: Stack(children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Image.asset(
                                    'assets/mousq.png',
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 300),
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
                                              appCubit.address!.locality
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            const Icon(
                                              Icons.location_on,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                        //location
                                        Text(
                                          '${appCubit.address!.administrativeArea}, ${appCubit.address!.country}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),

                                        GestureDetector(
                                          onTap: () {
                                            refreshScreen();
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '  $formattedTime : اخر تحديث',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 23,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Icon(
                                                Icons.update,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        //times
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFFFFFFF)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1.0),
                                            child: Column(
                                              children: [
                                                prayTimeRow(
                                                    en: 'Fajr',
                                                    time: appCubit.timesModel!
                                                        .data.timings.fajr,
                                                    ar: 'الفجر'),
                                                const SizedBox(height: 10),
                                                prayTimeRow(
                                                    en: 'Sunrise',
                                                    time: appCubit.timesModel!
                                                        .data.timings.sunrise,
                                                    ar: 'الشروق'),
                                                const SizedBox(height: 10),
                                                prayTimeRow(
                                                    en: 'Dhuhr',
                                                    time: appCubit.timesModel!
                                                        .data.timings.dhuhr,
                                                    ar: 'الظهر'),
                                                const SizedBox(height: 10),
                                                prayTimeRow(
                                                    en: 'Asr',
                                                    time: appCubit.timesModel!
                                                        .data.timings.asr,
                                                    ar: 'العصر'),
                                                const SizedBox(height: 10),
                                                prayTimeRow(
                                                    en: 'Maghrib',
                                                    time: appCubit.timesModel!
                                                        .data.timings.maghrib,
                                                    ar: 'المغرب'),
                                                const SizedBox(height: 10),
                                                prayTimeRow(
                                                    en: 'Isha',
                                                    time: appCubit.timesModel!
                                                        .data.timings.isha,
                                                    ar: 'العشاء'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ]),
                            ),
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
                              ),
                            ),
                          ],
                        ),
                      ));
      },
    );
  }
}
