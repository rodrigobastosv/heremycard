import 'package:heremycard/db/db_utils.dart';

class CardModel {
  int id;
  int fontColor;
  String label;
  String name;
  String profession;
  String profileImagePath;
  String backgroundImagePath;
  String phone;
  String email;
  String whatsapp;

  CardModel();

  static CardModel fromJson(Map<String, dynamic> json) {
    return CardModel()
      ..id = json[ID]
      ..label = json[NAME]
      ..name = json[NAME]
      ..profession = json[PROFESSION]
      ..profileImagePath = json[PROFILE_IMAGE_PATH]
      ..backgroundImagePath = json[BACKGROUND_IMAGE_PATH]
      ..fontColor = json[FONT_COLOR]
      ..phone = json[PHONE]
      ..email = json[EMAIL]
      ..whatsapp = json[WHATSAPP];
  }

  static Map<String, dynamic> toJson(CardModel instance) {
    return <String, dynamic>{
      ID: instance.id,
      LABEL: instance.label,
      NAME: instance.name,
      PROFESSION: instance.profession,
      PROFILE_IMAGE_PATH: instance.profileImagePath,
      BACKGROUND_IMAGE_PATH: instance.backgroundImagePath,
      FONT_COLOR: instance.fontColor,
      PHONE: instance.phone,
      EMAIL: instance.email,
      WHATSAPP: instance.whatsapp
    };
  }

  @override
  String toString() {
    return 'CardModel{id: $id, label: $label, name: $name, profession: $profession, profileImagePath: $profileImagePath, backgroundImagePath: $backgroundImagePath, fontColor: $fontColor, phone: $phone, email: $email, whatsapp: $whatsapp}';
  }
}