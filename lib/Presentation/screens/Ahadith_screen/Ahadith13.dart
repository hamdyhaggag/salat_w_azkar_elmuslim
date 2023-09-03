import 'package:flutter/material.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_container.dart';

class Ahadith13 extends StatelessWidget {
  final String title;
  const Ahadith13({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'من كمال الإيمان '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    'عَنْ أَبِيْ حَمْزَة أَنَسِ بنِ مَالِكٍ رَضِيَ اللهُ تَعَالَى عَنْهُ خَادِمِ رَسُوْلِ اللهِ ﷺ عَن النبي ﷺ قَالَ: (لاَ يُؤمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لأَخِيْهِ مَا يُحِبُّ لِنَفْسِهِ) \nرواه البخاري ومسلم',
                maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
