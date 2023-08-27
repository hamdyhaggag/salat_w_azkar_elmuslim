import 'dart:convert';
import 'dart:developer';

import 'package:salat_w_azkar_elmuslim/models/times_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //===============================================================

  static saveData({
    required String key,
    required dynamic value,
  }) async {
    log("saving >>> $value into local >>> with key $key");

    if (value is String) {
      if (sharedPreferences != null) sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      if (sharedPreferences != null) sharedPreferences!.setInt(key, value);
    }
    if (value is double) {
      if (sharedPreferences != null) sharedPreferences!.setDouble(key, value);
    }
    if (value is bool) {
      if (sharedPreferences != null) sharedPreferences!.setBool(key, value);
    }
  }

  //===============================================================

  static String getData({required String key}) {
    return sharedPreferences == null
        ? 'DEFAULT_VALUE'
        : sharedPreferences!.getString(key) ?? "";
  }

  static int getInteger({required String key}) {
    return sharedPreferences == null ? 0 : sharedPreferences!.getInt(key) ?? 0;
  }

  static bool getBoolean({required String key}) {
    return sharedPreferences == null
        ? false
        : sharedPreferences!.getBool(key) ?? false;
  }

  //===============================================================

  static Future<bool> removeData({required String key}) async {
    //return await sharedPreferences!.clear();
    return await sharedPreferences!.remove(key);
  }
}

void saveTimeModel({
  required TimesModel timeModel,
}) async {
  await CacheHelper.saveData(
    key: 'TimesModel',
    value: json.encode(timeModel.toJson()),
  );
}

Future<TimesModel?> getTimeModel() async {
  final timeModel = CacheHelper.getData(key: 'TimesModel');
  if (timeModel.isNotEmpty) {
    return TimesModel.fromJson(jsonDecode(timeModel));
  } else {
    return null;
  }
}
