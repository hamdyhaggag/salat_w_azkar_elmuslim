// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_cubit.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_states.dart';
import 'package:salat_w_azkar_elmuslim/core/colors.dart';
import 'package:salat_w_azkar_elmuslim/models/row.dart';
import 'package:salat_w_azkar_elmuslim/models/custom_reset_button.dart';
import '../models/custom_app_bar.dart';

class Sebha extends StatelessWidget {
  const Sebha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'السبحة'),
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          final cubit = AppCubit.get(context);
          return ListView(
            children: [
              GestureDetector(
                onTap: cubit.incrementCounter,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(
                      'assets/circle2.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.6,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        '${cubit.counter}',
                        style: TextStyle(
                          fontSize: cubit.counter < 1000 ? 85 : 65,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const MyCustomRow(),
                    const SizedBox(height: 20),
                    AppButton(
                      horizontalPadding: 50,
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
          );
        },
      ),
    );
  }
}
