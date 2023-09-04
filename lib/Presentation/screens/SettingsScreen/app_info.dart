import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../Widgets/custom_app_bar.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'معلومات عن التطبيق'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl, // Set text direction to RTL
              child: Text(
                'نظرة عامة:\nتم تطوير تطبيق \" تَفَكٌر - Tafakkur "\ ليكون رفيقًا إسلاميًا شاملاً يساعد المستخدمين على الالتزام بالعبادات والأعمال الصالحة في حياتهم اليومية.\n يقدم التطبيق مجموعة من الميزات المتميزة التي تساعد المستخدمين على تحسين تجربتهم الدينية :\n\nمواقيت الصلاة الدقيقة :\n يقدم التطبيق مواقيت الصلاة الدقيقة استنادًا إلى موقع المستخدم، مما يسهل عليهم أداء الصلوات في أوقاتها المحددة.\n\nاتجاه القبلة :\n يُتيح التطبيق للمستخدمين تحديد اتجاه القبلة بناءً على موقعهم الحالي، مما يسهل عليهم تحديد القبلة أثناء الصلاة.\n\nأذكار وأدعية :\n يقدم التطبيق مجموعة واسعة من الأذكار والأدعية التي يمكن للمستخدمين الاستفادة منها في مختلف الأوقات والمواقف.\n\nسبحة إلكترونية :\n يمكن للمستخدمين استخدام السبحة الإلكترونية في التطبيق لذكر الله وتعزيز التواصل مع دينهم.\n\nتصميم بسيط وسهل الاستخدام :\n يتميز التطبيق بواجهة مستخدم بسيطة وجذابة تجعله سهل الاستخدام للجميع، بغض النظر عن مستوى خبرتهم التكنولوجية .',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ));
  }
}
