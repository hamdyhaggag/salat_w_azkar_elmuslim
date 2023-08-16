import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MotafarekkatScreen extends StatelessWidget {
  const MotafarekkatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'متفرقات',
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
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  FontAwesomeIcons.chevronRight,
                  color: Color(0xff1E5A83),
                ))
          ],
        ),
        body: Column(children: [
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 40),
            child: Stack(children: [
              Image.asset(
                'assets/mot.png',
                alignment: Alignment.topCenter,
              ),
              const Positioned(
                top: 30,
                left: 90,
                child: Text('متفرقات',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ]),
          ),
        ]));
  }
}
