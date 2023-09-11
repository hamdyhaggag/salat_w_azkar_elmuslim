import 'package:flutter/material.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_container.dart';

class Ahadith11 extends StatelessWidget {
  final String title;
  const Ahadith11({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'اترك ما شككت فيه '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                headtitle: 'الحديث الحادي عشر',
                title:
                    'عَنْ أَبِي مُحَمَّدٍ الحَسَنِ بنِ عَلِيّ بنِ أبِي طالبٍ سِبْطِ رَسُولِ اللهِ ﷺ وَرَيْحَانَتِهِ رَضِيَ اللهُ عَنْهُمَا قَالَ: حَفِظْتَ مِنْ رَسُوْلِ اللهِ ﷺ : (دَعْ مَا يَرِيْبُكَ إِلَى مَا لاَ يَرِيْبُكَ) \nرواه الترمذي والنسائي \nوقال الترمذي: حديث حسن صحيح.',
                maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
