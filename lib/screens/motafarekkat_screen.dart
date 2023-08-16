import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/models/custom_app_bar.dart';
import 'package:salat_w_azkar_elmuslim/models/rounded_container.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/roqia.dart';
import 'azkar_screens/collection.dart';
import 'azkar_screens/dead.dart';
import 'azkar_screens/evening.dart';
import 'azkar_screens/mohamed.dart';
import 'azkar_screens/morning.dart';
import 'azkar_screens/plus.dart';
import 'azkar_screens/pray.dart';
import 'azkar_screens/quran.dart';
import 'azkar_screens/sleep.dart';
import 'azkar_screens/tasabeh.dart';
import 'azkar_screens/wake.dart';

class MotafarekkatScreen extends StatelessWidget {
  const MotafarekkatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'متفرقات'),
        body: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/mot.png',
                    alignment: Alignment.topCenter,
                  ),
                  const Positioned(
                    top: 50,
                    left: 135,
                    child: Text(
                      'متفرقات',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255),
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        name: 'أذكار بعد الصلاة',
                        screeen: const PrayAzkar(title: 'أذكار بعد الصلاة'),
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
                        name: 'الْأدْعِيَةُ القرآنية',
                        screeen:
                            const QuranAzkar(title: 'الْأدْعِيَةُ القرآنية'),
                        context: context),
                    azkarButton(
                        name: 'الْأدْعِيَةُ النبوية',
                        screeen:
                            const MohamedAzkar(title: 'الْأدْعِيَةُ النبوية'),
                        context: context),
                    azkarButton(
                        name: 'تسابيح',
                        screeen: const Tasabeh(title: 'تسابيح'),
                        context: context),
                    azkarButton(
                        name: 'جوامع الدعاء',
                        screeen: const PlusAzkar(title: 'جوامع الدعاء'),
                        context: context),
                    azkarButton(
                        name: 'أدعية للميّت',
                        screeen: const DeadAzkar(title: 'أدعية للميّت'),
                        context: context),
                    azkarButton(
                        name: 'الرُّقية الشرعية من القرآن والسنة',
                        screeen: const Rokia(
                            title: 'الرُّقية الشرعية من القرآن والسنة'),
                        context: context),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
