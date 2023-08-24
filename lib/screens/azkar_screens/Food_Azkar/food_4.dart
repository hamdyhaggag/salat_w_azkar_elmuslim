import 'package:flutter/material.dart';

import '../../../models/custom_app_bar.dart';
import '../../../models/custom_container.dart';

class Food4 extends StatelessWidget {
  const Food4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'الدعاء لمن سقاه أو إذا أراد ذلك'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    'اللَّهُمَّ أَطْعِمْ مَنْ أَطْعَمَنِي ، وَأَسْقِ مَنْ أَسْقَانِي',
                maxValue: 1,
                initialCounterValue: 0),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
