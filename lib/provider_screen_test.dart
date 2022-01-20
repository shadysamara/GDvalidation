import 'package:flutter/material.dart';
import 'package:project3/my_provider.dart';
import 'package:provider/provider.dart';

class ProviderScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            Provider.of<MyProvider>(context).name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          RaisedButton(onPressed: () {
            Provider.of<MyProvider>(context, listen: false)
                .changeName('hello world');
          })
        ],
      ),
    );
  }
}
