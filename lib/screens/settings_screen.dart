import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/screens/timings_screen.dart';

import '../models/custom_app_bar.dart';
import '../models/row_with_text_and_icon.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'الإعدادات'),

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
        body: Column(children: [
          SizedBox(height: 20.0), // Add a SizedBox here for spacing
          Column(
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
        ]));
  }
}
