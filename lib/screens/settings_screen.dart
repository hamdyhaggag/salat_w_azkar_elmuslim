import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/widgets.dart';
import '../models/custom_app_bar.dart';
import '../models/row_with_text_and_icon.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'الإعدادات'),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              Navigator.pop(
                  context); // This will pop the current screen from the navigation stack.
            },
            child: const RowWithTextAndIcon(
              'الشاشة الرئيسية',
              FontAwesomeIcons.house,
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              showMethods(context);
            },
            child: const RowWithTextAndIcon(
              'طريقة تحديد مواعيد الصلاة',
              FontAwesomeIcons.clock,
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              showappinfo(context);
            },
            child: const RowWithTextAndIcon(
              'معلومات عن التطبيق',
              Icons.info,
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              showprivacy(context);
            },
            child: const RowWithTextAndIcon(
              'سياسة الخصوصية',
              Icons.privacy_tip_rounded,
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              showInfo(context);
            },
            child: const RowWithTextAndIcon(
              'تواصل معي',
              Icons.person,
            ),
          ),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              shareOptions(context);
            },
            child: const RowWithTextAndIcon(
              'شارك التطبيق',
              Icons.share,
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
