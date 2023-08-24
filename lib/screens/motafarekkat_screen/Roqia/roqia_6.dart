import 'package:flutter/material.dart';

import '../../../models/custom_app_bar.dart';
import '../../../models/custom_container.dart';

class Roqia6 extends StatelessWidget {
  const Roqia6({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: ' الدعاء في ثلث الليل الأخير'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ ، أَنَّ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ قَالَ : " يَنْزِلُ رَبُّنَا تَبَارَكَ وَتَعَالَى كُلَّ لَيْلَةٍ إِلَى السَّمَاءِ الدُّنْيَا ، حِينَ يَبْقَى ثُلُثُ اللَّيْلِ الْآخِرُ ، يَقُولُ : مَنْ يَدْعُونِي فَأَسْتَجِيبَ لَهُ ؟ مَنْ يَسْأَلُنِي فَأُعْطِيَهُ ؟ مَنْ يَسْتَغْفِرُنِي فَأَغْفِرَ لَهُ ؟ " .',
                maxValue: 1,
                initialCounterValue: 0),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
