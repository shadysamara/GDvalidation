import 'package:flutter/material.dart';
import 'package:project3/local_storage/sp_helper.dart';
import 'package:project3/local_storage/sp_screen_test.dart';
import 'package:project3/my_provider.dart';
import 'package:project3/provider_screen_test.dart';
import 'package:project3/register_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPrefrences();
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) {
      return MyProvider();
    },
    child: MaterialApp(
      home: SplachScreen(),
    ),
  ));
}

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((v) {
      bool isFirstTime = SpHelper.spHelper.getIsFirstTime();
      if (isFirstTime) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
      SpHelper.spHelper.setIsFirstTimeValue();
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('LOGIN PAGE'),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('Home PAGE'),
      ),
    );
  }
}
