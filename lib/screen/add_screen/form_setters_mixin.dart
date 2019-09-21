import 'package:flutter/material.dart';
import 'package:heremycard/model/card_model.dart';

mixin FormSettersMixin {
  static final cardModel = CardModel();

  final FormFieldSetter<String> labelSetter =
      (String label) => cardModel.label = label;
  final FormFieldSetter<String> nameSetter =
      (String name) => cardModel.name = name;
  final FormFieldSetter<String> professionSetter =
      (String profession) => cardModel.profession = profession;
  final FormFieldSetter<String> phoneSetter =
      (String phone) => cardModel.phone = phone;
  final FormFieldSetter<String> emailSetter =
      (String email) => cardModel.email = email;
  final FormFieldSetter<String> whatsappSetter =
      (String whatsapp) => cardModel.whatsapp = whatsapp;
  final FormFieldSetter<String> profileImagePathSetter =
      (String profileImagePath) =>
          cardModel.profileImagePath = profileImagePath;
  final FormFieldSetter<String> backgroundImagePathSetter =
      (String backgroundImagePath) =>
          cardModel.backgroundImagePath = backgroundImagePath;

  void setId(int id) => cardModel.id = id;
  void setProfileImagePath(String profileImage) => cardModel.profileImagePath = profileImage;
}
