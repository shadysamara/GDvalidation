import 'package:flutter/material.dart';
import 'package:project3/my_provider.dart';
import 'package:project3/provider_screen_test.dart';
import 'package:project3/register_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) {
      return MyProvider();
    },
    child: MaterialApp(
      home: ProviderScreenTest(),
    ),
  ));
}
