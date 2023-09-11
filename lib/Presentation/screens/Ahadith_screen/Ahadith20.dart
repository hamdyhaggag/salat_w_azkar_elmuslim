import 'package:flutter/material.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_container.dart';

class Ahadith20 extends StatelessWidget {
  final String title;
  const Ahadith20({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'الحياء من الإيمان '),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomContainer(
                headtitle: 'الحديث العشرون',
                title:
                    'عَنْ أَبيْ مَسْعُوْدٍ عُقبَة بنِ عَمْرٍو الأَنْصَارِيِّ البَدْرِيِّ رضي الله عنه قَالَ: قَالَ رَسُوْلُ اللهِ ﷺ (إِنَّ مِمَّا أَدرَكَ النَاسُ مِن كَلاَمِ النُّبُوَّةِ الأُولَى إِذا لَم تَستَحْيِ فاصْنَعْ مَا شِئتَ) \nرواه البخاري.',
                maxValue: 1),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
