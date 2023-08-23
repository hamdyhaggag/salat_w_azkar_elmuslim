import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_cubit.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_states.dart';
import 'package:salat_w_azkar_elmuslim/core/colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.changeMaxCounter(int.parse(title ?? '9999'));
          },
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 27,
            child: title == null
                ? const Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: Icon(
                      FontAwesomeIcons.infinity,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                : Text(
                    title!,
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
