import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Food_Azkar/food.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Sleep_Azkar/sleep.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Travel_Azkar/travel.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/evening.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/morning_view.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Pray_Azkar/pray.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/wake.dart';

import '../../constants/app_text.dart';
import '../Widgets/azkar_button.dart';
import '../Widgets/custom_app_bar.dart';
import 'azkar_screens/dead.dart';
import 'azkar_screens/quran.dart';
import 'motafarekkat_screen/Roqia/roqia.dart';
import 'motafarekkat_screen/nabawi_Azkar.dart';
import 'motafarekkat_screen/plus.dart';
import 'motafarekkat_screen/tasabeh.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'الأذكار', isHome: true),
        body: ListView(
          children: [
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Image.asset(
                'assets/azkarcont.png',
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              height: 20.h,
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
