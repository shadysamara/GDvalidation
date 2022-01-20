import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String name = 'omar';
  String country = 'palestine';
  String city = 'gaza';
  String area = 'isalmic university';
  bool acceptConditions = false;
  changeAcceptConditions() {
    acceptConditions = !acceptConditions;
    notifyListeners();
  }

  changeName(String newName) {
    this.name = newName;
    notifyListeners();
  }
}
