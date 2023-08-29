import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:salat_w_azkar_elmuslim/Data/Web_Services/cache_helper.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/azkar_screen.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/motafarekkat_screen.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/qibla_screen.dart';
import 'package:salat_w_azkar_elmuslim/Data/Web_Services/dio_helper.dart';
import 'package:salat_w_azkar_elmuslim/Data/Model/times_model.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/sebha_screen.dart';
import 'package:salat_w_azkar_elmuslim/Presentation/screens/timings_screen.dart';

import '../../Data/Model/direction_model.dart';
import '../../Presentation/Widgets/widgets.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int index = 0;

  List<Widget> get buildScreens {
    return [
      const TimingsScreen(),
      const Sebha(),
      const AzkarScreen(),
      const MotafarekkatScreen(),
      const QiblaScreen(),
    ];
  }

  void changeIndex(int newIndex) {
    index = newIndex;
    Vibrate.feedback(FeedbackType.impact);
    emit(ChangeBottomNavState());
  }

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/home.png"),
        ),
        label: 'الرئيسية'),
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/tasbih.png"),
        ),
        label: 'السبحة'),
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/azkar.png"),
        ),
        label: 'الأذكار'),
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/motafarrekat.png"),
        ),
        label: 'متفرقات'),
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/compass.png"),
        ),
        label: 'القبلة'),
  ];

  ////////////////////////////////////////////////////////////////////

  int counter = 0;

  void incrementCounter() {
    if (counter < maxCounter) {
      counter++;
      emit(ChangeCounterState());
      if (counter == maxCounter) {
        counterReachedMax();
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

  Future<void> getMyCurrentLocation() async {
    log('getMyCurrentLocation');
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

  bool errorStatus = false;
  TimesModel? timesModel;

  Future<void> getTimings({
    required String time,
    required double latitude,
    required double longitude,
  }) async {
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
        log(error.toString());
        emit(GetTimingsError());
      }
    });
  }

  DirectionModel? directionModel;

  Future<void> getDirection({
    required double latitude,
    required double longitude,
  }) async {
    await DioHelper.getData(
      url: "qibla/$latitude/$longitude",
    ).then((value) {
      directionModel = DirectionModel.fromJson(value.data);

      emit(GetDirectionSuccess());
    }).catchError((error) {
      log(error.toString());
      emit(GetDirectionError());
    });
  }

  Placemark? address;

  Future<void> getCurrentLocationAddress({
    required double latitude,
    required double longitude,
  }) async {
    log('getCurrentLocationAddress');
    await placemarkFromCoordinates(latitude, longitude).then((value) {
      address = value[0];
      emit(GetCurrentAddressSuccess());
    }).catchError((error) {
      log(error.toString());
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
