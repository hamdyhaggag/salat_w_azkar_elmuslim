import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/models/custom_container.dart';

import '../../models/custom_app_bar.dart';

class NabawiAzkar extends StatelessWidget {
  final String title;
  const NabawiAzkar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'الأدعية النبوية '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(title: '', maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
