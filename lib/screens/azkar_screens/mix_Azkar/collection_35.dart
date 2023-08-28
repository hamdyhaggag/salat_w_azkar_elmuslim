import 'package:flutter/material.dart';

import '../../../Widgets/custom_app_bar.dart';
import '../../../Widgets/custom_container.dart';

class Mix35 extends StatelessWidget {
  const Mix35({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'سيد الاستغفار '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
                title:
                    'اللهم أنت ربي لا إله إلا أنت ، خلقتني وأنا عبدك وأنا على عهدك ووعدك ما استطعت أعوذ بك من شر ما صنعت، أبوئ لك بنعمتك على وأبوئ بذنبي ، فاغفر لي فانه لا يغفر الذنوب إلا أنت',
                maxValue: 1,
                initialCounterValue: 0),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
