import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/azan/azan1.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/azan/azan2.dart';
import 'package:salat_w_azkar_elmuslim/screens/azkar_screens/Pray_Azkar/azan/azan3.dart';

import '../../../../models/custom_app_bar.dart';
import '../../../../models/custom_folder_row.dart';

class Azan extends StatelessWidget {
  final String title;
  const Azan({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الآذان'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Azan1(),
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
                    builder: (context) => const Azan2(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'الدعاء بعد الآذان'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Azan3(),
                  ),
                );
              },
              child:
                  const CustomFolderRow(title: 'الدعاء بين الآذان و الإقامة'),
            ),
          ],
        ),
      ),
    );
  }
}
