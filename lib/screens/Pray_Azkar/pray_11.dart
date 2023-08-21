import 'package:flutter/material.dart';

import '../../models/custom_app_bar.dart';
import '../../models/custom_container.dart';

class Pray11 extends StatelessWidget {
  const Pray11({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: '1'),
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
