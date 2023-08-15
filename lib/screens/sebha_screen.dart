// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/core/bottom_nav_bar.dart';

class Sebha extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'السبحة',
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
              onPressed: () {},
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
                    height: 700,
                    width: 700,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                  Positioned(
                    top: 270,
                    left: 230 - counterWidth() / 2,
                    child: Text(
                      '$counter',
                      style: const TextStyle(
                        fontSize: 90,
                        color: Color(0xff1E5A83),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
