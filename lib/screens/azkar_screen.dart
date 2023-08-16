import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/models/custom_app_bar.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/collection.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/dead.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/evening.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/mohamed.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/morning.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/plus.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/pray.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/quran.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/roqia.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/sleep.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/tasabeh.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/wake.dart';
import '../models/azkar_button.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'الأذكار'),
        body: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/azkarcont.png',
                    alignment: Alignment.topCenter,
                  ),
                  const Positioned(
                    top: 50,
                    left: 65,
                    child: Text(
                      'الأذكار ',
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
