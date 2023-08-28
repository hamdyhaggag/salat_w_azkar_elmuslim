import 'package:flutter/material.dart';

import '../../../Widgets/custom_app_bar.dart';
import '../../../Widgets/custom_container.dart';

class Mix30 extends StatelessWidget {
  const Mix30({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: ' دعـاء سجود التلاوة'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
                title:
                    'سجد وجهي للذي خلقه ،وشق سمعه وبصره بحوله وقوته ( فتبارك الله احسن الخالقين )',
                maxValue: 1,
                initialCounterValue: 0),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
