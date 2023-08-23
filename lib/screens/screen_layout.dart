import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_cubit.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_states.dart';
import 'package:salat_w_azkar_elmuslim/core/colors.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(builder: (context, state) {
      final cubit = AppCubit.get(context);
      return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 23,
          unselectedFontSize: 23,
          iconSize: 30,
          elevation: 100,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: cubit.bottomItems,
          currentIndex: cubit.index,
          selectedItemColor: AppColors.primaryColor,
          onTap: (index) {
            cubit.changeIndex(index);
          }),
        body: cubit.buildScreens[cubit.index],
    );
    },);
  }
}
