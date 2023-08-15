import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/core/widgets.dart';
import 'package:salat_w_azkar_elmuslim/screens/timings_screen.dart';

import '../models/row_with_text_and_icon.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'الإعدادات',
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1E5A83)),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                FontAwesomeIcons.chevronRight,
                color: Color(0xff1E5A83),
              ))
        ],
      ),
      // body: const Column(
      //   children: [
      //     const SizedBox(
      //       height: 40,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           InkWell(
      //             onTap: () {
      //               showMethods(context);
      //             },
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   border: Border.all(color: const Color(0xff1E5A83)),
      //                   borderRadius: BorderRadius.circular(15),
      //                   color: Colors.white),
      //               child: const Padding(
      //                 padding:
      //                     EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
      //                 child: Text(
      //                   'طريقة تحديد مواقيت الصلاة',
      //                   textDirection: TextDirection.rtl,
      //                   style:
      //                       TextStyle(fontSize: 30, color: Color(0xff1E5A83)),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(height: 20),
      //           InkWell(
      //             onTap: () {
      //               showInfo(context);
      //             },
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   border: Border.all(color: const Color(0xff1E5A83)),
      //                   borderRadius: BorderRadius.circular(15),
      //                   color: Colors.white),
      //               child: const Padding(
      //                 padding:
      //                     EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
      //                 child: Text(
      //                   'تواصل معنا',
      //                   textDirection: TextDirection.rtl,
      //                   style:
      //                       TextStyle(fontSize: 30, color: Color(0xff1E5A83)),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      body: const Column(
        children: <Widget>[
          RowWithTextAndIcon('الشاشة الرئيسية', FontAwesomeIcons.house,
              widget: TimingsScreen()),
          SizedBox(height: 16.0),
          RowWithTextAndIcon(
            'طريقة تحديد مواعيد الصلاة',
            FontAwesomeIcons.bolt,
          ),
          SizedBox(height: 16.0),
          RowWithTextAndIcon(
            'تواصل معي',
            Icons.person,
          ),
          SizedBox(height: 16.0),
          RowWithTextAndIcon(
            'تعليمات',
            Icons.info,
          ),
        ],
      ),
    );
  }
}
