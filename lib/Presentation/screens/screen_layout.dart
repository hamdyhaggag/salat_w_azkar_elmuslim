import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/colors.dart';

import '../../Business_Logic/Cubit/app_cubit.dart';
import '../../Business_Logic/Cubit/app_states.dart';
import '../Widgets/app_dialog.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;

        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 23,
              unselectedFontSize: 23,
              iconSize: 30,
              elevation: 100,
              backgroundColor:
                  isDarkMode ? const Color(0xff1F1F1F) : Colors.white,
              type: BottomNavigationBarType.fixed,
              items: cubit.bottomItems,
              currentIndex: cubit.index,
              selectedItemColor:
                  isDarkMode ? const Color(0xff0c8ee1) : Colors.white,
              onTap: (index) {
                cubit.changeIndex(index);
              }),
          body: WillPopScope(
              onWillPop: () async {
                if (cubit.index != 4) {
                  cubit.changeIndex(4);
                  return Future.value(false);
                } else {
                  AppDialog.showAppDialog(
                    context: context,
                    content: 'هل تود الخروج من التطبيق ؟',
                    okAction: AppDialogAction(
                      title: 'نعم',
                      onTap: () {
                        SystemNavigator.pop();
                      },
                    ),
                    cancelAction: AppDialogAction(
                      title: 'لا',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                  return Future.value(false);
                }
              },
              child: cubit.buildScreens[cubit.index]),
        );
      },
    );
  }
}
