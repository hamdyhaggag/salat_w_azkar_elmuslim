import 'package:flutter/material.dart';

import '../app_cubit/app_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: BottomNavigationBar(
          selectedFontSize: 23,
          unselectedFontSize: 23,
          iconSize: 30,
          elevation: 100,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: AppCubit().bottomItems,
          currentIndex: AppCubit().currentIndex,
          onTap: (index) {
            AppCubit().changeBottomNavBar(index, context);
          }),
    ));
  }
}
