import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salat_w_azkar_elmuslim/app_cubit/app_cubit.dart';
import 'package:salat_w_azkar_elmuslim/core/cache_helper.dart';
import 'package:salat_w_azkar_elmuslim/core/dio_helper.dart';
import 'package:salat_w_azkar_elmuslim/Widgets/widgets.dart';
import 'package:salat_w_azkar_elmuslim/screens/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  radioValue = CacheHelper.getInteger(key: 'value');

  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getMyCurrentLocation(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
          builder: (context, child) => ResponsiveWrapper.builder(child,
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ],
              background: Container(color: const Color(0xFFFFFFFF))),
          title: "Tafakkur - تَفكر",
          theme: ThemeData(
            tooltipTheme: const TooltipThemeData(
                textStyle: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: 'Cairo')),
            textTheme: const TextTheme(
              titleMedium: TextStyle(fontSize: 25, fontFamily: 'Cairo'),
              bodyMedium: TextStyle(fontSize: 30, fontFamily: 'Cairo'),
            ),
            fontFamily: 'Cairo',
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
