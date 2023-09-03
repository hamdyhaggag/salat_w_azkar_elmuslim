import 'package:flutter/material.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_container.dart';

class Ahadith40 extends StatelessWidget {
  final String title;
  const Ahadith40({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'كن في الدنيا كأنك غريب '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    ' عَنِ ابْنِ عُمَرَ رَضِيَ اللهُ عَنْهُمَا قَالَ: أَخَذَ رَسُولُ اللهِ ﷺ بِمنْكبيَّ فَقَالَ: (كُنْ فِي الدُّنْيَا كَأَنَّكَ غَرِيْبٌ أَوْ عَابِرُ سَبِيْلٍ) وَكَانَ ابْنُ عُمَرَ رَضِيَ اللهُ عَنْهُمَا يَقُوْلُ: إِذَا أَمْسَيْتَ فَلا تَنْتَظِرِ الصَّبَاحَ، وَإِذَا أَصْبَحْتَ فَلا تَنْتَظِرِ المَسَاءَ. وَخُذْ مِنْ صِحَّتِكَ لِمَرَضِكَ، وَمِنْ حَيَاتِكَ لمَوْتِكَ..\nرواه البخاري.',
                maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
