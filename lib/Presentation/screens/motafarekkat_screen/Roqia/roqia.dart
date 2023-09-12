import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen/Roqia/roqia_1.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen/Roqia/roqia_2.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen/Roqia/roqia_3.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen/Roqia/roqia_4.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen/Roqia/roqia_5.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen/Roqia/roqia_6.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen/Roqia/roqia_7.dart';

import '../../../Widgets/custom_app_bar.dart';
import '../../../Widgets/custom_folder_row.dart';

class RoqiaScreen extends StatelessWidget {
  final String title;
  const RoqiaScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الرقية الشرعية'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Roqia1(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الرقية الشرعية من القرآن'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Roqia2(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الرقية الشرعية من السنة'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Roqia3(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' مشروعية الرقية'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Roqia4(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' القرآن شفاء لكل داء'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Roqia5(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الصلاة من أسباب العلاج'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Roqia6(),
                  ),
                );
              },
              child:
                  const CustomFolderRow(title: ' الدعاء في ثلث الليل الأخير'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Roqia7(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الحجامة من أسباب العلاج'),
            ),
          ],
        ),
      ),
    );
  }
}
