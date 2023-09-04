import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_folder_row.dart';
import '../../Widgets/row_with_text_and_icon.dart';
import '../../Widgets/widgets.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'الإعدادات'),
      body: Column(
        children: <Widget>[
          SizedBox(height: 7.h),
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
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              showMethods(context);
            },
            child: const RowWithTextAndIcon(
              'طريقة تحديد مواقيت الصلاة',
              Icons.timer,
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              showappinfo(context);
            },
            child: const RowWithTextAndIcon(
              'معلومات عن التطبيق',
              Icons.info,
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              showprivacy(context);
            },
            child: const RowWithTextAndIcon(
              'سياسة الخصوصية',
              Icons.privacy_tip_rounded,
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              sendEmail();
            },
            child: const RowWithTextAndIcon(
              'تواصل معنا',
              Icons.mail_rounded,
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              Donate(context);
            },
            child: const RowWithTextAndIcon(
              'ادعمنا',
              FontAwesomeIcons.circleDollarToSlot,
            ),
          ),
          SizedBox(height: 10.0.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              shareFeedback(context);
            },
            child: const RowWithTextAndIcon(
              'تقييم التطبيق',
              Icons.star,
            ),
          ),
          SizedBox(height: 10.0.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          InkWell(
            onTap: () {
              shareOptions(context);
            },
            child: const RowWithTextAndIcon(
              'شارك التطبيق',
              Icons.share,
            ),
          ),
          SizedBox(height: 10.0.h),
          Container(
            height: 2.h,
            width: 420.w,
            color: colorWithOpacity,
          ),
          // InkWell(
          //   onTap: () {
          //     // Handle the tap event here
          //     // You can toggle the Switch's state or perform any other action
          //   },
          //   child: Row(
          //     children: [
          //       Flexible(
          //         flex: 1,
          //         child: Container(), // Adjust the flex value as needed
          //         // Replace with any content you want before the Switch
          //       ),
          //       Switch(
          //         value: false, // Replace with the actual boolean value
          //         onChanged: (newValue) {
          //           // Update the switch's state when it's toggled
          //           // You can also perform any additional actions here
          //         },
          //       ),
          //       const Flexible(
          //         flex: 14, // Adjust the flex value as needed
          //         child: RowWithTextAndIcon(
          //           'التنبية لأذكار الصباح',
          //           Icons.sunny,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 10.0),
          // Container(
          //   height: 2,
          //   width: 420,
          //   color: colorWithOpacity,
          // ),
          // InkWell(
          //   onTap: () {
          //     // Handle the tap event here
          //     // You can toggle the Switch's state or perform any other action
          //   },
          //   child: Row(
          //     children: [
          //       Flexible(
          //         flex: 1,
          //         child: Container(), // Adjust the flex value as needed
          //         // Replace with any content you want before the Switch
          //       ),
          //       Switch(
          //         value: true, // Replace with the actual boolean value
          //         onChanged: (newValue) {
          //           // Update the switch's state when it's toggled
          //           // You can also perform any additional actions here
          //         },
          //       ),
          //       const Flexible(
          //         flex: 14, // Adjust the flex value as needed
          //         child: RowWithTextAndIcon(
          //           'التنبية لأذكار المساء',
          //           Icons.notifications_active_rounded,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 10.0),
          // Container(
          //   height: 2,
          //   width: 420,
          //   color: colorWithOpacity,
          // ),
          // InkWell(
          //   onTap: () {
          //     // Handle the tap event here
          //     // You can toggle the Switch's state or perform any other action
          //   },
          //   child: Row(
          //     children: [
          //       Flexible(
          //         flex: 1,
          //         child: Container(), // Adjust the flex value as needed
          //         // Replace with any content you want before the Switch
          //       ),
          //       Switch(
          //         value: true, // Replace with the actual boolean value
          //         onChanged: (newValue) {
          //           // Update the switch's state when it's toggled
          //           // You can also perform any additional actions here
          //         },
          //       ),
          //       const Flexible(
          //         flex: 14, // Adjust the flex value as needed
          //         child: RowWithTextAndIcon(
          //           'إشعار يوم الجمعة',
          //           Icons.notifications_active_rounded,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 10.0),
          // Container(
          //   height: 2,
          //   width: 420,
          //   color: colorWithOpacity,
          // ),
        ],
      ),
    );
  }
}
