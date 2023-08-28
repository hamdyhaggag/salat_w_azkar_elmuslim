import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/azan/azan.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_10.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_11.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_12.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_13.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_14.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_15.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_16.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_17.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_18.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/Wodoo/wodoo.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_3.dart.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_4.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_5.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_6.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_7.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_8.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/pray_9.dart';
import '../../../Widgets/custom_app_bar.dart';
import '../../../Widgets/custom_folder_row.dart';

class PrayAzkar extends StatelessWidget {
  final String title;
  const PrayAzkar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'أذكار الصلاة'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Azan(title: 'الآذان'),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'الآذان'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Wodoo(
                      title: 'الوضوء',
                    ),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'الوضوء'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray3(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'المسجد'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray4(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء استفتاح الصلاة'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray5(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: ' دعاء استفتاح الصلاة إذا قام من الليل'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray6(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: ' دعاء الوسوسة في الصلاة و القراءة'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray7(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء الركوع'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray8(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء الرفع من الركوع'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray9(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء السجود'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray10(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء الجلسة بين السجدتين'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray11(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' التشهد'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray12(),
                  ),
                );
              },
              child:
                  const CustomFolderRow(title: ' الصلاة على النبي بعد التشهد'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray13(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: ' الدعاء بعد التشهد الأخير قبل السلام'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray14(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الأذكار بعد السلام '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray15(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء صلاة الاستخارة'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray16(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء قنوت الوتر'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray17(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الذكر عقب السلام من الوتر'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Pray18(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: ' كيف كان النبي صلى الله علية و سلم يُسبح'),
            ),
          ],
        ),
      ),
    );
  }
}
