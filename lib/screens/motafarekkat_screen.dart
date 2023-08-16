import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/models/custom_app_bar.dart';
import 'package:salat_w_azkar_elmuslim/models/azkar_button.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/roqia.dart';
import 'azkar_screens/dead.dart';
import 'azkar_screens/evening.dart';
import 'azkar_screens/mohamed.dart';
import 'azkar_screens/morning_view.dart';
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
                        name: 'الدعاء عند رؤية الهلال',
                        screeen: const MorningAzkar(title: 'أذكار الصباح'),
                        context: context),
                    azkarButton(
                        name: 'من أدعية الاستسقاء',
                        screeen: const EveningAzkar(title: 'أذكار  المساء'),
                        context: context),
                    azkarButton(
                        name: 'الدعاء إذا نزل المطر',
                        screeen: const PrayAzkar(title: 'أذكار بعد الصلاة'),
                        context: context),
                    azkarButton(
                        name: 'الدعاء عند شدة نزول المطر',
                        screeen: const SleepAzkar(title: 'أذكار النوم'),
                        context: context),
                    azkarButton(
                        name: 'الدعاء عند هبوب الريح',
                        screeen: const PlusAzkar(title: 'جوامع الدعاء'),
                        context: context),
                    azkarButton(
                        name: 'دعاء الرعد',
                        screeen: const DeadAzkar(title: 'أدعية للميّت'),
                        context: context),
                    azkarButton(
                        name: 'ما يعصم الله به من الدجال ',
                        screeen: const WakeUpAzkar(title: 'أذكار الإستيقاظ'),
                        context: context),
                    azkarButton(
                        name: 'دعاء قضاء الدين',
                        screeen:
                            const MohamedAzkar(title: 'الْأدْعِيَةُ النبوية'),
                        context: context),
                    azkarButton(
                        name: 'دعاء من استصعب علية أمر',
                        screeen: const Tasabeh(title: 'تسابيح'),
                        context: context),
                    azkarButton(
                        name: 'الرُّقية الشرعية من القرآن ',
                        screeen: const Rokia(
                            title: 'الرُّقية الشرعية من القرآن والسنة'),
                        context: context),
                    azkarButton(
                        name: 'الرُّقية الشرعية من السنة',
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
