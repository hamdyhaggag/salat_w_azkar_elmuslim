import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Food_Azkar/food_1.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Food_Azkar/food_2.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Food_Azkar/food_3.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Food_Azkar/food_4.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Food_Azkar/food_5.dart';
import '../../../models/custom_app_bar.dart';
import '../../../models/custom_folder_row.dart';

class FoodAzkar extends StatelessWidget {
  final String title;
  const FoodAzkar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'أذكار الطعام'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Food1(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'قبل الطعام'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Food2(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'بعد الطعام'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Food3(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء الضيف لصاحب الطعام'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Food4(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: 'الدعاء لمن سقاه أو إذا أراد ذلك'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Food5(),
                  ),
                );
              },
              child:
                  const CustomFolderRow(title: ' الدعاء إذا أفطر عند أهل بيت'),
            ),
          ],
        ),
      ),
    );
  }
}
