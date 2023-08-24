import 'package:flutter/material.dart';

import '../../../models/custom_app_bar.dart';
import '../../../models/custom_container.dart';

class Mix10 extends StatelessWidget {
  const Mix10({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: ' دعاء ركوب الدابة أو ما يقوم مقامها'),
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
