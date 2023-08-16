// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/models/bottom_nav_bar.dart';
import 'package:salat_w_azkar_elmuslim/models/row.dart';
import 'package:salat_w_azkar_elmuslim/models/floating_button.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  _SebhaState createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'السبحة',
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1E5A83)),
              ),
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
      body: SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: incrementCounter,
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  const BottomNavBar(),
                  Image.asset(
                    'assets/circle2.png',
                    height: 711,
                    width: 700,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                  Positioned(
                    top: 270,
                    left: 232 - counterWidth() / 2,
                    child: Text(
                      '$counter',
                      style: const TextStyle(
                        fontSize: 90,
                        color: Color(0xff1E5A83),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 630,
                    left: 0,
                    right: 0,
                    child: MyCustomRow(),
                  ),
                  const Positioned(
                    top: 716,
                    left: 130,
                    child: CustomResetButton(),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  double counterWidth() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$counter',
        style: const TextStyle(
          fontSize: 80,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }
}
