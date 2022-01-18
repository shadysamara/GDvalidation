import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String labelText;
  Function validationFun;
  TextEditingController controller;
  TextInputType textInputType;
  CustomTextfield(
      {this.labelText,
      this.validationFun,
      this.controller,
      this.textInputType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: (value) => validationFun(value),
        decoration: InputDecoration(
            label: Text(labelText),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
