import 'package:flutter/material.dart';

class TextFormfieldWithPadding extends StatelessWidget {
  TextFormfieldWithPadding({this.initialValue = '',
    this.label,
    this.setter,
    this.validator,
    this.inputType = TextInputType.text,
    this.focusNode,
    this.nextFocusNode,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next});

  final String initialValue;
  final String label;
  final FormFieldSetter<String> setter;
  final FormFieldValidator<String> validator;
  final TextInputType inputType;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final Function onFieldSubmitted;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        focusNode: focusNode,
        initialValue: initialValue,
        validator: validator,
        onSaved: setter,
        keyboardType: inputType,
        textInputAction: textInputAction,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocusNode);
          if (onFieldSubmitted != null) {
            onFieldSubmitted();
          }
        },
      ),
    );
  }
}