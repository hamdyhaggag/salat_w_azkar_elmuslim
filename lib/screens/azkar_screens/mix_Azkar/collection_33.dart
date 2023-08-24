import 'package:flutter/material.dart';

import '../../../models/custom_app_bar.dart';
import '../../../models/custom_container.dart';

class Mix33 extends StatelessWidget {
  const Mix33({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'عند فعل الذنب أو ارتكاب المعصية'),
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
