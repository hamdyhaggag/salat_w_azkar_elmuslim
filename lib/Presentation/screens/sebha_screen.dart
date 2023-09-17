// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import '../../../constants/colors.dart';

import '../../Business_Logic/Cubit/app_cubit.dart';
import '../../Business_Logic/Cubit/app_states.dart';
import '../Widgets/custom_app_bar.dart';
import '../Widgets/custom_reset_button.dart';
import '../Widgets/my_custom_row.dart';

class Sebha extends StatelessWidget {
  const Sebha({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xff1F1F1F) : Colors.white,
      appBar: const CustomAppBar(title: 'السبحة', isHome: true),
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          final cubit = AppCubit.get(context);
          return ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView(
              children: [
                GestureDetector(
                  onTap: cubit.incrementCounter,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        isDarkMode
                            ? 'assets/circle1.png'
                            : 'assets/circle2.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.7,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          '${cubit.counter}',
                          style: TextStyle(
                            fontSize: cubit.counter < 1000 ? 65 : 45,
                            color: isDarkMode
                                ? Colors.grey
                                : AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: isDarkMode ? Colors.transparent : Colors.white,
                  child: Column(
                    children: [
                      const MyCustomRow(),
                      SizedBox(height: 20.h),
                      AppButton(
                        horizontalPadding: 50.w,
                        onPressed: () {
                          cubit.resetCounter();
                          Vibrate.feedback(FeedbackType.heavy);
                        },
                        title: 'البدء من جديد',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
