import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/colors.dart';
import 'package:salat_w_azkar_elmuslim/Data/Web_Services/functions.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/SettingsScreen/app_info.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/SettingsScreen/privacy_policy.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Business_Logic/Cubit/app_cubit.dart';
import '../../Business_Logic/Cubit/app_states.dart';

Widget prayTimeRow({
  required String en,
  required String time,
  required String ar,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            en,
            style: const TextStyle(fontSize: 35),
          )),
          Expanded(
              child: Text(
            time,
            style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E5A83)),
          )),
          Expanded(
              child: Text(
            ar,
            textDirection: TextDirection.rtl,
            style: const TextStyle(fontSize: 35),
          )),
        ],
      ),
    );

int radioValue = 5;

Widget radioItem({
  required String title,
  required int value,
  required BuildContext context,
}) =>
    RadioListTile(
      title: Text(title,
          textDirection: TextDirection.rtl,
          style: TextStyle(color: AppColors.primaryColor)),
      value: value,
      groupValue: radioValue,
      onChanged: (value) {
        AppCubit.get(context).changeRadio(value);
        Vibrate.feedback(FeedbackType.impact);
      },
    );

showMethods(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return SimpleDialog(
              titlePadding: const EdgeInsets.fromLTRB(0, 10, 12, 0),
              title: Text('طريقة تحديد مواقيت الصلاة',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: AppColors.primaryColor,
                  )),
              contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              children: <Widget>[
                radioItem(
                    title: 'رابطة العالم الإسلامي', value: 3, context: context),
                radioItem(
                    title: 'الهيئة المصرية العامة للمساحة',
                    value: 5,
                    context: context),
                radioItem(
                    title: 'جامعة العلوم الإسلامية في كراتشي',
                    value: 1,
                    context: context),
                radioItem(
                    title: 'الجمعية الإسلامية لأمريكا الشمالية',
                    value: 2,
                    context: context),
                radioItem(
                    title: 'معهد الجيوفيزياء في جامعة طهران',
                    value: 7,
                    context: context),
              ],
            );
          },
        );
      });
}

const String googlePlayUrl =
    'https://play.google.com/store/apps/developer?id=dev.hamdyhaggag';
void _launchURL(String link) async {
  Uri url = Uri.parse(link);

  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

Widget buildRow(IconData icon, String url, String title, Color color) {
  return InkWell(
    onTap: () {
      _launchURL(url);
    },
    child: SizedBox(
      height: 40,
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 30),
          Text(title),
        ],
      ),
    ),
  );
}

showInfo(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          titlePadding: const EdgeInsets.fromLTRB(0, 10, 12, 0),
          title: const Text('تواصل مع المطور عبر :',
              textDirection: TextDirection.rtl,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          children: <Widget>[
            buildRow(FontAwesomeIcons.github, 'https://github.com/hamdyhaggag',
                'جيت هب', Colors.black),
            const SizedBox(height: 5),
            buildRow(
              FontAwesomeIcons.linkedin,
              'https://www.linkedin.com/in/hamdyhaggag74/',
              'لينكد ان',
              Colors.blueAccent,
            ),
            const SizedBox(height: 5),
            buildRow(
              FontAwesomeIcons.facebook,
              'https://www.facebook.com/hamdyhaggag74/',
              'فيسبوك',
              Colors.blue,
            ),
            const SizedBox(height: 5),
            buildRow(
              FontAwesomeIcons.whatsapp,
              'https://api.whatsapp.com/send?phone=201154620997',
              'واتس اب',
              Colors.green,
            ),
            const SizedBox(height: 5),
          ],
        );
      });
}

////////////////////////////////////////

showprivacy(context) {
  navigateTo(context, const PrivacyPolicy());
}

showappinfo(context) {
  navigateTo(context, const AppInfo());
}

///////////////////////////////
///
showAlertdialogExampleDidntused(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Magical Portal'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('You have discovered a magical portal!'),
            SizedBox(height: 10),
            Text('Where would you like to go?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Forest'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Mountains'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Beach'),
          ),
        ],
      );
    },
  );
}

////////////////////////////////////////////////

void shareOptions(BuildContext context) async {
  const String text = googlePlayUrl;
  const String subject = "  Tafakkur - تطبيق تَفكر";

  // You can customize the sharing message as needed
  await Share.share(text, subject: subject);
}
