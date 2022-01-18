import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project3/customTextField.dart';
import 'package:project3/custom_checkbox.dart';
import 'package:string_validator/string_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String nullValidator(String value) {
    if (value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  emailValidation(String value) {
    if (!isEmail(value)) {
      return 'InCorrect Email syntax';
    }
  }

  String firstName;

  String lastName;

  String email;

  String phoneNumber;

  String address;

  register() {
    bool isSuccess = registerFormKey.currentState.validate();
    if (isSuccess) {
      registerFormKey.currentState.save();
      log(firstNameController.text);
    }
  }

  bool acceptConditions = false;
  String validateCheckBox(v) {
    if (!v) {
      return 'you have to accept our conditions';
    }
    return null;
  }

  saveCheckBoxResult(bool x) {
    this.acceptConditions = x;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Form(
          key: registerFormKey,
          child: ListView(
            children: [
              CustomTextfield(
                labelText: 'FirstName',
                validationFun: nullValidator,
                controller: firstNameController,
              ),
              CustomTextfield(
                labelText: 'LastName',
                validationFun: nullValidator,
                controller: lastNameController,
              ),
              CustomTextfield(
                labelText: 'Email',
                validationFun: emailValidation,
                controller: emailController,
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextfield(
                labelText: 'PhoneNumber',
                validationFun: nullValidator,
                controller: phoneController,
                textInputType: TextInputType.phone,
              ),
              CustomTextfield(
                labelText: 'Address',
                validationFun: nullValidator,
                controller: addressController,
              ),
              OmarWidget(
                title: Text('Accept conditions'),
                autovalidate: true,
                validator: validateCheckBox,
                onSaved: saveCheckBoxResult,
              ),
              /*FormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  builder: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                            title: Text('Accept conditions'),
                            value: acceptConditions,
                            onChanged: (v) {
                              this.acceptConditions = v;
                              state.didChange(v);
                              setState(() {});
                            }),
                        Text(
                          state.errorText ?? '',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    );
                  }),*/
              GestureDetector(
                onTap: () {
                  register();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'REGISTER',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
