import 'package:flutter/material.dart';

import '../../../../models/custom_app_bar.dart';
import '../../../../models/custom_container.dart';

class Azan3 extends StatelessWidget {
  const Azan3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'الدعاء بين الآذان و الإقامة'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    ' الدُّعَاءُ لَا يُرَدُّ بَيْنَ الْأَذَانِ وَالْإِقَامَةِ',
                maxValue: 1,
                initialCounterValue: 0),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
