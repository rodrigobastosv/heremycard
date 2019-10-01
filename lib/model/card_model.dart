import 'package:heremycard/db/db_utils.dart';

class CardModel {
  int id;
  int fontColor;
  int fontSize;
  int layout;
  String label;
  String name;
  String profession;
  String profileImagePath;
  String brandImagePath;
  String backgroundImagePath;
  String phone;
  String email;
  String whatsapp;

  CardModel();

  static CardModel fromJson(Map<String, dynamic> json) {
    return CardModel()
      ..id = json[ID]
      ..label = json[NAME]
      ..layout = json[LAYOUT]
      ..name = json[NAME]
      ..profession = json[PROFESSION]
      ..profileImagePath = json[PROFILE_IMAGE_PATH]
      ..brandImagePath = json[BRAND_IMAGE_PATH]
      ..backgroundImagePath = json[BACKGROUND_IMAGE_PATH]
      ..fontColor = json[FONT_COLOR]
      ..fontSize = json[FONT_SIZE]
      ..phone = json[PHONE]
      ..email = json[EMAIL]
      ..whatsapp = json[WHATSAPP];
  }

  static Map<String, dynamic> toJson(CardModel instance) {
    return <String, dynamic>{
      ID: instance.id,
      LABEL: instance.label,
      LAYOUT: instance.layout,
      NAME: instance.name,
      PROFESSION: instance.profession,
      PROFILE_IMAGE_PATH: instance.profileImagePath,
      BRAND_IMAGE_PATH: instance.brandImagePath,
      BACKGROUND_IMAGE_PATH: instance.backgroundImagePath,
      FONT_COLOR: instance.fontColor,
      FONT_SIZE: instance.fontSize,
      PHONE: instance.phone,
      EMAIL: instance.email,
      WHATSAPP: instance.whatsapp
    };
  }

  @override
  String toString() {
    return 'CardModel{id: $id, fontColor: $fontColor, fontSize: $fontSize, layout: $layout, label: $label, name: $name, profession: $profession, profileImagePath: $profileImagePath, brandImagePath: $brandImagePath, backgroundImagePath: $backgroundImagePath, phone: $phone, email: $email, whatsapp: $whatsapp}';
  }
}
