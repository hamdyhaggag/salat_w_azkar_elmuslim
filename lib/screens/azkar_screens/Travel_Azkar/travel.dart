import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_1.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_10.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_2.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_3.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_4.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_5.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_6.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_7.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_8.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Travel_Azkar/travel_9.dart';
import '../../../models/custom_app_bar.dart';
import '../../../models/custom_folder_row.dart';

class TravelAzkar extends StatelessWidget {
  final String title;
  const TravelAzkar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'أذكار السفر'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel1(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء المسافر للمقيم'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel2(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء المقيم للمسافر'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel3(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'السفر'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel4(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'الركوب'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel5(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الدعاء إذا عثر المركوب'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel6(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: 'التكبير و التسبيح في سير السفر'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel7(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'نزول المنزل'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel8(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء المسافر إذا أصبح'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel9(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دخول البلدة'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Travel10(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'ذكر الرجوع من السفر '),
            ),
          ],
        ),
      ),
    );
  }
}
