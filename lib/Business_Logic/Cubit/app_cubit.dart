import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tafakkur/constants/colors.dart';
import '../../Data/Model/direction_model.dart';
import '../../Data/Model/times_model.dart';
import '../../Data/Web_Services/cache_helper.dart';
import '../../Data/Web_Services/dio_helper.dart';
import '../../Presentation/screens/ahadith_screen.dart';
import '../../Presentation/screens/azkar_screen.dart';
import '../../Presentation/screens/qibla_screen.dart';
import '../../Presentation/screens/sebha_screen.dart';
import '../../Presentation/screens/timings_screen.dart';
import '../../main.dart';
import 'app_states.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isLightMode = true;

  void changeAppMode({required bool? isLight}) {
    isLightMode = !isLightMode;
    CacheHelper.saveData(key: 'isLight', value: isLightMode);
    emit(ThemeChangeModeState());
  }

  int index = 4;

  List<Widget> get buildScreens {
    return [
      const QiblaScreen(),
      const AhadithScreen(),
      const AzkarScreen(),
      const Sebha(),
      const TimingsScreen(),
    ];
  }

  void changeIndex(int newIndex) {
    index = newIndex;
    Vibrate.feedback(FeedbackType.impact);
    emit(ChangeBottomNavState());
  }

  List<BottomNavigationBarItem> get bottomItems {
    return [
      BottomNavigationBarItem(
        icon: ColorFiltered(
          colorFilter: ColorFilter.mode(
            index == 0 ? AppColors.primaryColor : Colors.grey,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset(
            "assets/icon/Qibla.svg",
            height: 24,
          ),
        ),
        label: 'القبلة',
      ),
      BottomNavigationBarItem(
        icon: ColorFiltered(
          colorFilter: ColorFilter.mode(
            index == 1 ? AppColors.primaryColor : Colors.grey,
            BlendMode.srcIn, // This mode applies the color to the SVG icon.
          ),
          child: SvgPicture.asset(
            "assets/icon/Ahadith.svg",
            height: 24,
          ),
        ),
        label: 'الأربعين',
      ),
      BottomNavigationBarItem(
        icon: ColorFiltered(
          colorFilter: ColorFilter.mode(
            index == 2 ? AppColors.primaryColor : Colors.grey,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset(
            "assets/icon/Azkar.svg",
            height: 24,
          ),
        ),
        label: 'الأذكار',
      ),
      BottomNavigationBarItem(
        icon: ColorFiltered(
          colorFilter: ColorFilter.mode(
            index == 3 ? AppColors.primaryColor : Colors.grey,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset(
            "assets/icon/Tasbih.svg",
            height: 24,
          ),
        ),
        label: 'السبحة',
      ),
      BottomNavigationBarItem(
        icon: ColorFiltered(
          colorFilter: ColorFilter.mode(
            index == 4 ? AppColors.primaryColor : Colors.grey,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset(
            "assets/icon/Home.svg",
            height: 24,
          ),
        ),
        label: 'الرئيسية',
      ),
    ];
  }

  ////////////////////////////////////////////////////////////////////

  int counter = 0;

  void incrementCounter() {
    if (counter < maxCounter) {
      counter++;
      emit(ChangeCounterState());
      if (counter == maxCounter) {
        counterReachedMax();
        Fluttertoast.showToast(
          msg: 'انتقل إلى عدد أكبر أو ابدأ من جديد ',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      Vibrate.feedback(FeedbackType.heavy);
    }
  }

  void counterReachedMax() {
    log('Vibrate'); //showToast
  }

  int maxCounter = 33;

  void changeMaxCounter(int max) {
    maxCounter = max;
    emit(ChangeMaxCounterState());
  }

  void resetCounter() {
    counter = 0;
    emit(ChangeCounterState());
  }

  ////////////////////////////////////////////////////////////////////

  Position? position;
  bool errorStatus = false;

  Future<void> getMyCurrentLocation() async {
    emit(GetCurrentAddressLoading());
    await Geolocator.requestPermission().then((value) async {
      await Geolocator.getCurrentPosition(
              timeLimit: const Duration(milliseconds: 3000),
              desiredAccuracy: LocationAccuracy.high)
          .then((value) async {
        position = value;

        await getCurrentLocationAddress(
          latitude: position!.latitude,
          longitude: position!.longitude,
        );

        await getTimings(
          latitude: position!.latitude,
          longitude: position!.longitude,
          time: DateTime.now().millisecondsSinceEpoch.toString(),
        );

        await getDirection(
          latitude: position!.latitude,
          longitude: position!.longitude,
        );
        emit(GetCurrentLocationSuccess());
      }).catchError((error) async {
        timesModel = await getTimeModel();
        if (timesModel == null) {
          errorStatus = true;
          log('Error when get Current Location $error');
          emit(GetCurrentLocationError());
        } else {
          emit(GetTimingsSuccess());
        }
      });
    }).catchError((error) {
      errorStatus = true;
      log('Error when request Location Permission $error');
      emit(GetCurrentLocationError());
    });
  }

  TimesModel? timesModel;

  Future<void> getTimings({
    required String time,
    required double latitude,
    required double longitude,
  }) async {
    emit(GetCurrentAddressLoading());
    time = time.substring(0, time.length - 3);
    await DioHelper.getData(
      url: "timings/$time",
      latitude: latitude,
      longitude: longitude,
      method: radioValue,
    ).then((value) {
      timesModel = TimesModel.fromJson(value.data);
      saveTimeModel(timeModel: timesModel!);
      emit(GetTimingsSuccess());
    }).catchError((error) async {
      timesModel = await getTimeModel();
      if (timesModel == null) {
        errorStatus = true;
        log('getTimings error is $error');
        emit(GetTimingsError());
      }
    });
  }

  DirectionModel? directionModel;

  Future<void> getDirection({
    required double latitude,
    required double longitude,
  }) async {
    emit(GetCurrentAddressLoading());
    await DioHelper.getData(
      url: "qibla/$latitude/$longitude",
    ).then((value) {
      directionModel = DirectionModel.fromJson(value.data);

      emit(GetDirectionSuccess());
    }).catchError((error) {
      log('getDirection error is $error');
      emit(GetDirectionError());
    });
  }

  Placemark? address;
  String? administrativeArea;
  String? country;
  String? locality;

  Future<void> getCurrentLocationAddress({
    required double latitude,
    required double longitude,
  }) async {
    emit(GetCurrentAddressLoading());
    await placemarkFromCoordinates(latitude, longitude).then((value) {
      address = value[0];
      administrativeArea = address!.administrativeArea;
      country = address!.country;
      locality = address!.locality;
      CacheHelper.saveData(
          key: 'administrativeArea', value: administrativeArea);
      CacheHelper.saveData(key: 'country', value: country);
      CacheHelper.saveData(key: 'locality', value: locality);

      emit(GetCurrentAddressSuccess());
    }).catchError((error) {
      log('getCurrentLocationAddress error is $error');
      emit(GetCurrentAddressError());
    });
  }

  ////////////////////////////////////////////////////////////////////

  void decreaseTimes({required int times}) {
    emit(DecreaseTimes());
  }

  void changeRadio(value) {
    radioValue = value;
    emit(ChangeRadio());

    CacheHelper.saveData(key: 'value', value: value);
    getMyCurrentLocation();
  }
}
