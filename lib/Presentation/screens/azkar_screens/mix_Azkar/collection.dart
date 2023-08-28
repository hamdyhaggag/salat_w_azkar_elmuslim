import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_1.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_10.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_11.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_12.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_13.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_14..dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_15.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_16.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_17.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_18.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_19.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_2.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_20.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_21.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_22.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_23.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_24.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_25.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_26.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_27.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_28.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_29.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_3.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_30.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_31.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_32.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_33.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_34.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_35.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_36.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_4.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_5.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_6.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_7.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_8.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screens/mix_Azkar/collection_9.dart';
import '../../../Widgets/custom_app_bar.dart';
import '../../../Widgets/custom_folder_row.dart';

class CollectionAzkar extends StatelessWidget {
  final String title;
  const CollectionAzkar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'أذكار متفرقة'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix1(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء لبس الثوب'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix2(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء لبس الثوب الجديد'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix3(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء الكرب'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix4(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء الهم والحزن'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix5(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء قضاء الدين'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix6(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء الريح'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix7(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء الرعـد'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix8(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء زيارة القبور'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix9(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء  نزول المطر'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix10(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: ' دعاء ركوب الدابة أو ما يقوم مقامها'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix11(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء من استصعب عليه أمر'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix12(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعـاء الخوف من الشــرك'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix13(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' ما يقال في المجلس'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix14(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' كفارة المجلس '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix15(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء من رأى مبتلى'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix16(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعـاء الغـضـب'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix17(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الدعاء للمتزوج'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix18(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء المتزوج لنفسه'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix19(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'الدعاء قبل الجماع '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix20(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء العطاس '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix21(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الدعاء عند افطار الصائم'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix22(),
                  ),
                );
              },
              child:
                  const CustomFolderRow(title: 'الدعاء إذا أفطر عند أهل بيت '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix23(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء رؤية الهلال '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix24(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء من أصيب بمصيبة'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix25(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' الدعاء للمريض في عيادته'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix26(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: 'دعاء المريض الذي يئس من حياته '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix27(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' ما يعوذ به الأولاد'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix28(),
                  ),
                );
              },
              child:
                  const CustomFolderRow(title: 'دعاء لقاء العدو وذي السلطان '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix29(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعـاء صـلاة الاستخـارة'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix30(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعـاء سجود التلاوة'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix31(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'دعاء الاستفتاح '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix32(),
                  ),
                );
              },
              child: const CustomFolderRow(title: ' دعاء دخول السوق'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix33(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: 'عند فعل الذنب أو ارتكاب المعصية'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix34(),
                  ),
                );
              },
              child: const CustomFolderRow(
                  title: 'الدعاء عند سماع أصوات الحيوانات'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix35(),
                  ),
                );
              },
              child: const CustomFolderRow(title: 'سيد الاستغفار '),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Mix36(),
                  ),
                );
              },
              child:
                  const CustomFolderRow(title: 'الدعاء إذا أحسست بوجع في جسدك'),
            ),
          ],
        ),
      ),
    );
  }
}
