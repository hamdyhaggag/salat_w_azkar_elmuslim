import 'dart:developer';
import 'package:device_preview/device_preview.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Business_Logic/Cubit/app_cubit.dart';
import 'Business_Logic/Cubit/app_states.dart';
import 'Data/Web_Services/cache_helper.dart';
import 'Data/Web_Services/dio_helper.dart';
import 'Presentation/screens/splash_screen.dart';
import 'bloc_observer/bloc_observer.dart';
import 'firebase_options.dart';

TimeOfDay? stringToTimeOfDay(String timeString) {
  if (timeString.isNotEmpty) {
    return TimeOfDay(
        hour: int.parse(timeString.split(":")[0]),
        minute: int.parse(timeString.split(":")[1]));
  } else {
    return null;
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print(message.messageId);
  }
}

bool isEnterBefore = false;
int radioValue = 5;
bool isLight = CacheHelper.getBoolean(key: 'isLight');
TimeOfDay? selectedTimeMorning;
TimeOfDay? selectedTimeEvening;
String? selectedMorning;
String? selectedEvening;

var lightThemeData = ThemeData(
  primaryColor: Colors.blue,
  textTheme: const TextTheme(labelLarge: TextStyle(color: Colors.white70)),
  brightness: Brightness.light,
  hintColor: Colors.blue,
);

var darkThemeData = ThemeData(
  primaryColor: Colors.blue,
  textTheme: const TextTheme(labelLarge: TextStyle(color: Color(0xff1F1F1F))),
  brightness: Brightness.dark,
  hintColor: Colors.blue,
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await CacheHelper.init();

  radioValue = CacheHelper.getInteger(key: 'value');
  isEnterBefore = CacheHelper.getBoolean(key: 'isEnterBefore');
  selectedMorning = CacheHelper.getString(key: 'Morning');
  selectedEvening = CacheHelper.getString(key: 'Evening');

  log(selectedMorning!);
  log(selectedEvening!);

  selectedTimeMorning = stringToTimeOfDay(selectedMorning!);
  selectedTimeEvening = stringToTimeOfDay(selectedEvening!);

  DioHelper.init();

  Bloc.observer = MyGlobalObserver();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => EasyDynamicThemeWidget(
        child: MyApp(
          isLight: isLight,
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.isLight}) : super(key: key);
  final bool? isLight;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getMyCurrentLocation(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
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
              theme: lightThemeData.copyWith(
                textTheme: const TextTheme(
                  titleMedium: TextStyle(fontSize: 25, fontFamily: 'Cairo'),
                  bodyMedium: TextStyle(fontSize: 30, fontFamily: 'Cairo'),
                ),
              ),
              darkTheme: darkThemeData.copyWith(
                textTheme: const TextTheme(
                  titleMedium: TextStyle(
                      fontSize: 25, fontFamily: 'Cairo', color: Colors.white),
                  bodyMedium: TextStyle(
                      fontSize: 30, fontFamily: 'Cairo', color: Colors.white),
                ),
              ),
              themeMode: ThemeMode.system,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
