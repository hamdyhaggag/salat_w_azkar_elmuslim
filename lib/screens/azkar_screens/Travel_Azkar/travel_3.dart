import 'package:flutter/material.dart';

import '../../../models/custom_app_bar.dart';
import '../../../models/custom_container.dart';

class Travel3 extends StatelessWidget {
  const Travel3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'السفر'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ ، اللَّهُمَّ إِنَّا نَسْأَلُكَ فِي سَفَرِنَا هَذَا الْبِرَّ وَالتَّقْوَى ، وَمِنَ الْعَمَلِ مَا تَرْضَى ، اللَّهُمَّ هَوِّنْ عَلَيْنَا سَفَرَنَا هَذَا ، وَاطْوِ عَنَّا بُعْدَهُ ، اللَّهُمَّ أَنْتَ الصَّاحِبُ فِي السَّفَرِ ، وَالْخَلِيفَةُ فِي الْأَهْلِ ، اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ وَعْثَاءِ السَّفَرِ ، وَكَآبَةِ الْمَنْظَرِ ، وَسُوءِ الْمُنْقَلَبِ فِي الْمَالِ وَالْأَهْلِ " . وَإِذَا رَجَعَ قَالَهُنَّ ، وَزَادَ فِيهِنَّ : " آيِبُونَ ، تَائِبُونَ ، عَابِدُونَ ، لِرَبِّنَا حَامِدُونَ',
                maxValue: 1,
                initialCounterValue: 0),
            SizedBox(height: 15),
            CustomContainer(
                title:
                    'يُكَبِّرُ عَلَى كُلِّ شَرَفٍ مِنَ الْأَرْضِ ثَلَاثَ تَكْبِيرَاتٍ الله أكبر الله أكبر الله أكبر',
                maxValue: 3,
                initialCounterValue: 0),
            SizedBox(height: 15),
            CustomContainer(
                title:
                    'لَا إِلَهَ إِلَّا اللَّهُ ، وَحْدَهُ لَا شَرِيكَ لَهُ ، لَهُ الْمُلْكُ ، وَلَهُ الْحَمْدُ ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ ، آيِبُونَ ، تَائِبُونَ ، عَابِدُونَ ، سَاجِدُونَ لِرَبِّنَا ، حَامِدُونَ ، صَدَقَ اللَّهُ وَعْدَهُ ، وَنَصَرَ عَبْدَهُ ، وَهَزَمَ الْأَحْزَابَ وَحْدَهُ',
                maxValue: 1,
                initialCounterValue: 0),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
