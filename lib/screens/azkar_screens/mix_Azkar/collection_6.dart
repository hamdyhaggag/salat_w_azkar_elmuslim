import 'package:flutter/material.dart';

import '../../../models/custom_app_bar.dart';
import '../../../models/custom_container.dart';

class Mix6 extends StatelessWidget {
  const Mix6({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: ' دعاء الريح'),
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
