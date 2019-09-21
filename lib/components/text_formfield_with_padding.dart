import 'package:flutter/material.dart';

class TextFormfieldWithPadding extends StatelessWidget {
  TextFormfieldWithPadding(
      {this.initialValue = '',
      this.label,
      this.setter,
      this.validator,
      this.inputType = TextInputType.text});

  final String initialValue;
  final String label;
  final FormFieldSetter<String> setter;
  final FormFieldValidator<String> validator;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        initialValue: initialValue,
        validator: validator,
        onSaved: setter,
        keyboardType: inputType,
      ),
    );
  }
}
