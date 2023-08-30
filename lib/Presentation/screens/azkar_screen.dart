import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Food_Azkar/food.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Sleep_Azkar/sleep.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Travel_Azkar/travel.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/evening.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/morning_view.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Pray_Azkar/pray.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/wake.dart';

import '../Widgets/azkar_button.dart';
import '../Widgets/custom_app_bar.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'الأذكار', isHome: true),
        body: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/azkarcont.png',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.1790,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height *
                        0.05500, // Adjust the vertical position for centering
                    child: Text(
                      'الأذكار',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.08,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    azkarButton(
                        name: 'أذكار الصباح',
                        screeen: const MorningAzkar(title: 'أذكار الصباح'),
                        context: context),
                    azkarButton(
                        name: 'أذكار  المساء',
                        screeen: const EveningAzkar(title: 'أذكار  المساء'),
                        context: context),
                    azkarButton(
                        name: 'أذكار الصلاة',
                        screeen: const PrayAzkar(title: 'أذكار الصلاة'),
                        context: context),
                    azkarButton(
                        name: 'أذكار النوم',
                        screeen: const SleepAzkar(title: 'أذكار النوم'),
                        context: context),
                    azkarButton(
                        name: 'أذكار الإستيقاظ',
                        screeen: const WakeUpAzkar(title: 'أذكار الإستيقاظ'),
                        context: context),
                    azkarButton(
                        name: 'أذكار متفرقة',
                        screeen: const CollectionAzkar(title: 'أذكار متفرقة'),
                        context: context),
                    azkarButton(
                        name: 'أذكار الطعام',
                        screeen: const FoodAzkar(title: 'أذكار الطعام'),
                        context: context),
                    azkarButton(
                        name: 'أذكار السفر',
                        screeen:
                            const TravelAzkar(title: 'الْأدْعِيَةُ النبوية'),
                        context: context),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
