import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project3/local_storage/sp_helper.dart';

class SpScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text(SpHelper.spHelper.getIsFirstTime()
              ? 'hello my new friend'
              : 'hello my old friend'),
          onPressed: () {},
        ),
      ),
    );
  }
}
