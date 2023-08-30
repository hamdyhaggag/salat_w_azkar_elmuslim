import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen/Roqia/roqia.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/quran.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen/nabawi_Azkar.dart';
import '../Widgets/azkar_button.dart';
import '../Widgets/custom_app_bar.dart';
import 'azkar_screens/dead.dart';
import 'motafarekkat_screen/plus.dart';
import 'motafarekkat_screen/tasabeh.dart';

class MotafarekkatScreen extends StatelessWidget {
  const MotafarekkatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'متفرقات', isHome: true),
        body: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/mot.png',
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.0600,
                    child: Text(
                      'متفرقات',
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
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    azkarButton(
                        name: 'الأدعية القرآنية',
                        screeen: const QuranAzkar(title: 'الأدعية القراّنية'),
                        context: context),
                    azkarButton(
                        name: 'الأدعية النبوية',
                        screeen:
                            const NabawiAzkar(title: 'الْأدْعِيَةُ النبوية'),
                        context: context),
                    azkarButton(
                        name: 'تسبيحات',
                        screeen: const Tasabeh(title: 'تسبيحات'),
                        context: context),
                    azkarButton(
                        name: 'جوامع الدعاء',
                        screeen: const PlusAzkar(title: 'جوامع الدعاء'),
                        context: context),
                    azkarButton(
                        name: 'أدعية للميت',
                        screeen: const DeadAzkar(title: 'أدعية للميّت'),
                        context: context),
                    azkarButton(
                        name: 'الرقية الشرعية',
                        screeen: const RoqiaScreen(title: 'الرقية الشرعية'),
                        context: context),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
