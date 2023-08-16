// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../core/functions.dart';

Widget azkarButton({
  required String name,
  required Widget screeen,
  required BuildContext context,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xFF1E5A83),
            )),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: MaterialButton(
            color: Colors.white,
            highlightColor: const Color.fromARGB(255, 40, 148, 220),
            // splashColor: Colors.brown[200],
            onPressed: () {
              navigateTo(context, screeen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF1E5A83),
                  fontSize: 33.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
