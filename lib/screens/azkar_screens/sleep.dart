import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/models/custom_container.dart';

import '../../models/custom_app_bar.dart';

class SleepAzkar extends StatelessWidget {
  final String title;
  const SleepAzkar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'أذكار النوم'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(title: '1.', maxValue: 1, initialCounterValue: 0),
            SizedBox(height: 15),
            CustomContainer(title: '2', maxValue: 1, initialCounterValue: 0),
            SizedBox(height: 15),
            CustomContainer(title: '3', maxValue: 1, initialCounterValue: 0),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
