import 'package:flutter/material.dart';
import 'package:salat_w_azkar_elmuslim/core/widgets.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'الإعدادات',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff1E5A83),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showMethods(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff1E5A83)),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
                      child: Text(
                        'طريقة تحديد مواقيت الصلاة',
                        textDirection: TextDirection.rtl,
                        style:
                            TextStyle(fontSize: 30, color: Color(0xff1E5A83)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    showInfo(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff1E5A83)),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
                      child: Text(
                        'تواصل معنا',
                        textDirection: TextDirection.rtl,
                        style:
                            TextStyle(fontSize: 30, color: Color(0xff1E5A83)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
