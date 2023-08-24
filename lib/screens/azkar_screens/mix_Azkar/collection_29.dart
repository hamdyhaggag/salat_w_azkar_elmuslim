import 'package:flutter/material.dart';

import '../../../models/custom_app_bar.dart';
import '../../../models/custom_container.dart';

class Mix29 extends StatelessWidget {
  const Mix29({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: ' دعـاء صـلاة الاستخـارة'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(title: '', maxValue: 1, initialCounterValue: 0),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
