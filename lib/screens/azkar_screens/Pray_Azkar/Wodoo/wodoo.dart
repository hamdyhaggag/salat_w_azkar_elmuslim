import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/Wodoo/wodoo1.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/Wodoo/wodoo2.dart';

import '../../../../models/custom_app_bar.dart';
import '../../../../models/custom_folder_row.dart';

class Wodoo extends StatelessWidget {
  final String title;
  const Wodoo({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الوضوء'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Wodoo1(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'الذكر قبل الوضوء'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Wodoo2(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'الذكر بعد الفراغ من الوضوء'),
            ),
          ],
        ),
      ),
    );
  }
}
