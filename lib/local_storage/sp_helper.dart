import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    log('hello');
  }

  bool getIsFirstTime() {
    bool isFirstTime = sharedPreferences.getBool('isFirstTime') ?? true;
    return isFirstTime;
  }

  setIsFirstTimeValue() {
    sharedPreferences.setBool('isFirstTime', false);
  }

  saveMyName(String name) async {
    bool isSuccess = await sharedPreferences.setString('name', name);
    log(isSuccess.toString());
  }

  String getMyName() {
    return sharedPreferences.getString('name');
  }
}
