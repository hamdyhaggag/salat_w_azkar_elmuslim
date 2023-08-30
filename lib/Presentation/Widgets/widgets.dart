import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/constants/app_text.dart';

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
            flex: 1,
            child: AppText(
              en,
              fontSize: 24,
              align: TextAlign.end,
            ),
          ),
          Expanded(
            flex: 0,
            child: AppText(
              time,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppText(
              ar,
              fontSize: 24,
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );

int radioValue = 5;

Widget radioItem({
  required String title,
  required int value,
  required BuildContext context,
}) {
  final appCubit = AppCubit.get(context);

  return RadioListTile(
    title: AppText(
      title,
      fontSize: 16,
      textDirection: TextDirection.rtl,
      color: AppColors.primaryColor,
    ),
    value: value,
    groupValue: radioValue,
    onChanged: (newValue) {
      appCubit.changeRadio(newValue);
      Vibrate.feedback(FeedbackType.impact);
      Navigator.pop(context, newValue);
    },
  );
}

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

Donate(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.fromLTRB(0, 10, 12, 0),
        title: Text(
          'ادعمنا من خلال :',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: buildRow(
                  FontAwesomeIcons.circleDollarToSlot,
                  'https://www.buymeacoffee.com/hamdyhaggag74',
                  'Buy Me A Coffee',
                  AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: buildRow(
                  FontAwesomeIcons.circleDollarToSlot,
                  'https://www.paypal.com/paypalme/hamdyhaggag74',
                  'paypal',
                  AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
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

////////////////////////////////////////////////
void openGooglePlayForFeedback() async {
  const String packageName = 'com.tafakkur'; // Replace with your package name
  const String googlePlayUrl = 'market://details?id=$packageName';

  final Uri googlePlayUri = Uri.parse(googlePlayUrl);

  if (await canLaunchUrl(googlePlayUri)) {
    await launchUrl(googlePlayUri);
  } else {
    throw 'Could not launch Google Play Store.';
  }
}

void shareFeedback(BuildContext context) {
  openGooglePlayForFeedback();
}

////////////////////////////////////////////////
void sendEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'tafakkurapp@gmail.com', // Replace with the recipient's email address
    query:
        'subject=ملاحظات&body=  .. السلام عليكم ورحمة الله وبركاته ..\n  تمت تعبئة هذة الرسالة تلقائيا ، امسح نص الرسالة و اترك رسالتك', // Replace with your desired subject and body
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch email';
  }
}

////////////////////////////////////////////////
