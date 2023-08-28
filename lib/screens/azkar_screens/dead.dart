import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/Widgets/custom_container.dart';

import '../../Widgets/custom_app_bar.dart';

class DeadAzkar extends StatelessWidget {
  final String title;
  const DeadAzkar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'أدعية للميت '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                headtitle: 'أدعية للمتوفى (ذكور)',
                title:
                    ' اللَّهُمَّ أبدله داراً خيراً من داره، وأهلاً خيراً من أهله، وأدخله الجنّة، وأعذه من عذاب القبر ومن عذاب النّار',
                maxValue: 1),
            SizedBox(height: 15),
            CustomContainer(
                headtitle: 'أدعية للمتوفى (إناث) ',
                title:
                    ' اللَّهُمَّ أبدلها داراً خيراً من دارها، وأهلاً خيراً من أهلها، وأدخلها الجنّة، وأعذها من عذاب القبر ومن عذاب النّار  ',
                maxValue: 1),
            SizedBox(height: 15),
            CustomContainer(
                headtitle: 'أدعية للميّت الطفل الصغير (ذكر أو أنثى)',
                title:
                    ' اللَّهُمَّ اجْعَلْهُ فَرَطَاً وَذُخْراً لِوَالِدَيْهِ، وشَفِيعاً مُجَاباً، اللَّهُمَّ ثَقِّلْ بِهِ مَوَازِيْنَهُمَا، وأعْظِمْ بهِ أُجُورَهُمَا، وألْحِقْهُ بِصَالِحِ الـمُؤْمِنينَ، واجْعَلْهُ فِي كَفَالَةِ إِبْرَاهِيمَ، وَقِهِ بِرَحْمَتِكَ عَذَابَ الجَحِيمِ، وأبْدِلْهُ دَاراً خَيْراً مِنْ دَارِهِ، وَأَهْلاً خَيْراً مِنْ أَهْلِهِ، اللَّهُمَّ اغْفِرْ لأسْلاَفِنَا، وَأَفْرَاطِنَا، وَمَنْ سَبَقَنا بالإيْمَان ',
                maxValue: 1),
            SizedBox(height: 15),
            CustomContainer(
                headtitle: 'الدّعاء للميّت في صّلاة الجنازة',
                title:
                    ' اللَّهُمَّ اغْفِرْ لَهُ وَارْحَمْهُ وَعَافِهِ وَاعْفُ عَنْهُ ، وَأَكْرِمْ نُزُلَهُ ، وَوَسِّعْ مُدْخَلَهُ ، وَاغْسِلْهُ بِالْمَاءِ وَالثَّلْجِ وَالْبَرَدِ ، وَنَقِّهِ مِنْ الْخَطَايَا كَمَا نَقَّيْتَ الثَّوْبَ الْأَبْيَضَ مِنْ الدَّنَسِ ، وَأَبْدِلْهُ دَارًا خَيْرًا مِنْ دَارِهِ ، وَأَهْلًا خَيْرًا مِنْ أَهْلِهِ ، وَزَوْجًا خَيْرًا مِنْ زَوْجِهِ ، وَأَدْخِلْهُ الْجَنَّةَ ، وَقِهِ فِتْنَةَ الْقَبْرِ وَعَذَابَ النَّار',
                maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
