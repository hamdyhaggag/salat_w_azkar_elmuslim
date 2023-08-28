import 'package:flutter/material.dart';

import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Sleep_Azkar/sleep_1.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Sleep_Azkar/sleep_2.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Sleep_Azkar/sleep_3.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/Sleep_Azkar/sleep_4.dart';

import '../../../Widgets/custom_app_bar.dart';
import '../../../Widgets/custom_folder_row.dart';

class SleepAzkar extends StatelessWidget {
  final String title;
  const SleepAzkar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'أذكار النوم'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sleep1(title: 'أذكار النوم'),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'أذكار النوم'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sleep2(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'الدعاء إذا تقلب ليلاً'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sleep3(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء الفزع في النوم'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sleep4(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: ' ما يفعل من رأى الرؤيا اأو الحلم'),
            ),
          ],
        ),
      ),
    );
  }
}
