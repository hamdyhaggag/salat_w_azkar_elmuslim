import 'package:flutter/material.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_container.dart';

class Ahadith34 extends StatelessWidget {
  final String title;
  const Ahadith34({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'تغيير المنكر فريضة '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                title:
                    ' عَنْ أَبي سَعيدٍ الخُدريِّ رضي الله عنه قَالَ: سَمِعتُ رِسُولَ اللهِ ﷺ يَقولُ: (مَن رَأى مِنكُم مُنكَرَاً فَليُغَيِّرْهُ بِيَدِهِ، فَإِنْ لَمْ يَستَطعْ فَبِلِسَانِهِ، فَإِنْ لَمْ يَستَطعْ فَبِقَلبِه وَذَلِكَ أَضْعَفُ الإيمَانِ) \nرواه مسلم.',
                maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
