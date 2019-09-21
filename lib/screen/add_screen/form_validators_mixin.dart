import 'package:flutter/material.dart';

mixin FormValidatorsMixin {
  final FormFieldValidator<String> labelValidator =
      (String label) => label.isEmpty ? 'Required Field' : null;
  final FormFieldValidator<String> nameValidator =
      (String name) => name.isEmpty ? 'Required Field' : null;
  final FormFieldValidator<String> professionValidator =
      (String profession) => profession.isEmpty ? 'Required Field' : null;
}
