import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_cubit.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_states.dart';
import 'package:salat_w_azkar_elmuslim/core/colors.dart';
import 'package:salat_w_azkar_elmuslim/core/functions.dart';
import 'package:salat_w_azkar_elmuslim/screens/Settings/app_info.dart';
import 'package:salat_w_azkar_elmuslim/screens/Settings/privacy_policy.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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

Widget zekr({
  required String text1,
  required String text2,
  required String text3,
  required int times,
  required BuildContext context,
}) =>
    Column(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(width: 15),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      if (text1 != '')
                        Text(text1,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                            )),
                      if (text1 != '') const SizedBox(height: 5),
                      SelectableText(
                        text2,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (text3 != '') const SizedBox(height: 5),
                      if (text3 != '')
                        Text(text3,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                            )),
                    ],
                  )),
              const SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child: BlocConsumer<AppCubit, AppStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          if (times > 0) {
                            times--;
                            Vibrate.feedback(FeedbackType.impact);
                            if (times == 0) {
                              Vibrate.feedback(FeedbackType.success);
                            }
                          }
                          AppCubit.get(context).decreaseTimes(times: times);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.brown[300]),
                          child: Center(
                              child: times == 0
                                  ? const Text(
                                      'تم',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'التكرار',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          times.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40),
                                        ),
                                      ],
                                    )),
                        ),
                      );
                    },
                  )),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ],
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
    'https://play.google.com/store/apps/developer?id=dev.elsaraff';
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
              // TODO: Add logic for the chosen action
            },
            child: const Text('Forest'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Add logic for the chosen action
            },
            child: const Text('Mountains'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Add logic for the chosen action
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
