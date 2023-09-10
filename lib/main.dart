import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salat_w_azkar_elmuslim/Data/Web_Services/cache_helper.dart';
import 'package:salat_w_azkar_elmuslim/Data/Web_Services/dio_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/splash_screen.dart';
import 'package:salat_w_azkar_elmuslim/bloc_observer/bloc_observer.dart';
import 'Business_Logic/Cubit/app_cubit.dart';
import 'Presentation/Widgets/widgets.dart';
import 'firebase_options.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print(message.messageId);
  }
}

bool isEnterBefore = false;
int radioValue = 5;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await CacheHelper.init();

  radioValue = CacheHelper.getInteger(key: 'value');
  isEnterBefore = CacheHelper.getBoolean(key: 'isEnterBefore');

  DioHelper.init();

  Bloc.observer = MyGlobalObserver();

  runApp(
    DevicePreview(
      enabled: false, // Set to true to enable DevicePreview
      builder: (context) => const MyApp(),
    ),
  );
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
