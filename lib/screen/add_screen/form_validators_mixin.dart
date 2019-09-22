import 'package:flutter/material.dart';

mixin FormValidatorsMixin {
  final FormFieldValidator<String> labelValidator =
      (String label) => label.isEmpty ? 'Required Field' : null;
  final FormFieldValidator<String> nameValidator =
      (String name) => name.isEmpty ? 'Required Field' : null;
  final FormFieldValidator<String> professionValidator =
      (String profession) => profession.isEmpty ? 'Required Field' : null;
  final FormFieldValidator<String> emailValidator = (String email) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if (!emailValid) {
      return 'E-mail is not valid.';
    }
    return null;
  };
}
