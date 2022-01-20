import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String name = 'omar';
  changeName(String newName) {
    this.name = newName;
    notifyListeners();
  }
}
