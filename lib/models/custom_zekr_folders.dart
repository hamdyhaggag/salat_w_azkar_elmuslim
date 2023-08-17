// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:salat_w_azkar_elmuslim/models/custom_folder_row.dart';

import 'custom_app_bar.dart';

class CustomZekrFolder extends StatelessWidget {
  const CustomZekrFolder({
    Key? key,
    required this.title2,
    required this.title3,
  }) : super(key: key);
  final String title2;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: title2),
        body: Column(
          children: [
            CustomFolderRow(title: title3),
          ],
        ));
  }
}
