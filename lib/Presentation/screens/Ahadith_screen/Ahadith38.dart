import 'package:flutter/material.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_container.dart';

class Ahadith38 extends StatelessWidget {
  final String title;
  const Ahadith38({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'جزاء معادات الأولياء '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    'عَنْ أَبِي هُرَيْرَةَ رضي الله عنه قَالَ: قَالَ رَسُولُ اللهِ ﷺ : (إِنَّ اللهَ تَعَالَى قَالَ: مَنْ عَادَى لِي وَلِيَّاً فَقَدْ آذَنْتُهُ بِالحَرْبِ. وَمَا تَقَرَّبَ إِلِيَّ عَبْدِيْ بِشَيءٍ أَحَبَّ إِلِيَّ مِمَّا افْتَرَضْتُهُ عَلَيْهِ. ولايَزَالُ عَبْدِيْ يَتَقَرَّبُ إِلَيَّ بِالنَّوَافِلِ حَتَّى أُحِبَّهُ، فَإِذَا أَحْبَبتُهُ كُنْتُ سَمْعَهُ الَّذِيْ يَسْمَعُ بِهِ، وَبَصَرَهُ الَّذِيْ يُبْصِرُ بِهِ، وَيَدَهُ الَّتِي يَبْطِشُ بِهَا، وَرِجْلَهُ الَّتِي يَمْشِيْ بِهَا. وَلَئِنْ سَأَلَنِيْ لأُعطِيَنَّهُ، وَلَئِنْ اسْتَعَاذَنِيْ لأُعِيْذَنَّهُ) \nرواه البخاري ',
                maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
