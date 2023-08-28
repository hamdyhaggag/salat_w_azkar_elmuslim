import 'package:flutter/material.dart';

import '../../../Widgets/custom_app_bar.dart';
import '../../../Widgets/custom_container.dart';

class Pray15 extends StatelessWidget {
  const Pray15({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: ' دعاء صلاة الاستخارة'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    'اللَّهُمَّ إِنِّي أَسْتَخِيرُكَ بِعِلْمِكَ وَأَسْتَقْدِرُكَ بِقُدْرَتِكَ ، وَأَسْأَلُكَ مِنْ فَضْلِكَ الْعَظِيمِ ، فَإِنَّكَ تَقْدِرُ وَلَا أَقْدِرُ ، وَتَعْلَمُ وَلَا أَعْلَمُ ، وَأَنْتَ عَلَّامُ الْغُيُوبِ ، اللَّهُمَّ إِنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الْأَمْرَ - وَيُسَمِّي حَاجَتَهُ - خَيْرٌ لِي فِي دِينِي ، وَمَعَاشِي ، وَعَاقِبَةِ أَمْرِي " أَوْ قَالَ : " عَاجِلِ أَمْرِي وَآجِلِهِ ، فَاقْدُرْهُ لِي وَيَسِّرْهُ لِي ثُمَّ بَارِكْ لِي فِيهِ ، وَإِنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الْأَمْرَ - وَيُسَمِّي حَاجَتَهُ - شَرٌّ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي " أَوْ قَالَ : " فِي عَاجِلِ أَمْرِي وَآجِلِهِ ، فَاصْرِفْهُ عَنِّي وَاصْرِفْنِي عَنْهُ ، وَاقْدُرْ لِي الْخَيْرَ حَيْثُ كَانَ ، ثُمَّ أَرْضِنِي',
                maxValue: 1,
                initialCounterValue: 0),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
