import 'package:flutter/material.dart';
import 'package:project3/auth_provider.dart';
import 'package:project3/my_provider.dart';
import 'package:provider/provider.dart';

class ProviderScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Selector<MyProvider, bool>(builder: (context, acceptnaceBool, x) {
          return CheckboxListTile(
              title: Text('Accept Conditions'),
              value: acceptnaceBool,
              onChanged: (value) {
                Provider.of<MyProvider>(context, listen: false)
                    .changeAcceptConditions();
              });
        }, selector: (context, provider) {
          return provider.acceptConditions;
        }));
  }
}
