import 'package:flutter/material.dart';

class OmarWidget extends FormField<bool> {
  OmarWidget(
      {Widget title,
      FormFieldSetter<bool> onSaved,
      FormFieldValidator<bool> validator,
      bool initialValue = false,
      bool autovalidate = false})
      : super(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<bool> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                      title: title,
                      value: state.value,
                      onChanged: (v) {
                        state.didChange(v);
                      }),
                  Text(
                    state.errorText ?? '',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              );
            });
}
