import 'package:flutter/material.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_container.dart';

class Ahadith12 extends StatelessWidget {
  final String title;
  const Ahadith12({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'الاشتغال بما يفيد '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    'عَنْ أَبِيْ هُرَيْرَةَ رَضِيَ اللهُ عَنْهُ قَالَ: قَالَ رَسُوْلُ اللهِ ﷺ : (مِنْ حُسْنِ إِسْلامِ المَرْءِ تَرْكُهُ مَا لاَ يَعْنِيْهِ) حديثٌ حسنٌ،\n رواه الترمذي وغيره هكذا.',
                maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
