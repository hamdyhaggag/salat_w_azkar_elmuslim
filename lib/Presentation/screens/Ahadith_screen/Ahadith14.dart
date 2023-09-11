import 'package:flutter/material.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_container.dart';

class Ahadith14 extends StatelessWidget {
  final String title;
  const Ahadith14({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'متى يهدر دم المسلم؟ '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                headtitle: 'الحديث الرابع عشر',
                title:
                    'َعنِ ابْنِ مَسْعُودٍ رضي الله عنه قَالَ: قَالَ رَسُولُ اللهِ : (لا يَحِلُّ دَمُ امْرِئٍ مُسْلِمٍ إِلاَّ بإِحْدَى ثَلاثٍ: الثَّيِّبُ الزَّانِيْ، وَالنَّفْسُ بِالنَّفْسِ، وَالتَّاركُ لِدِيْنِهِ المُفَارِقُ للجمَاعَةِ)\n رواه البخاري ومسلم. ',
                maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
