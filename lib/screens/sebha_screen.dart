// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'السبحة',
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1E5A83)),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Color(0xff1E5A83),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          Expanded(
            child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: incrementCounter,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/circle2.png',
                        height: 900,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
                      Positioned(
                        top: 250,
                        left: 115,
                        child: Text(
                          '$counter',
                          style: const TextStyle(
                            fontSize: 80,
                            color: Color(0xff1E5A83),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
