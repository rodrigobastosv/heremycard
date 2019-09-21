class CardModel {
  int id;
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
      ..id = json['id']
      ..label = json['label']
      ..name = json['name']
      ..profession = json['profession']
      ..profileImagePath = json['profileImagePath']
      ..backgroundImagePath = json['backgroundImagePath']
      ..phone = json['phone']
      ..email = json['email']
      ..whatsapp = json['whatsapp'];
  }

  static Map<String, dynamic> toJson(CardModel instance) {
    return <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'name': instance.name,
      'profession': instance.profession,
      'profileImagePath': instance.profileImagePath,
      'backgroundImagePath': instance.backgroundImagePath,
      'phone': instance.phone,
      'email': instance.email,
      'whatsapp': instance.whatsapp
    };
  }

  @override
  String toString() {
    return 'CardModel{id: $id, label: $label, name: $name, profession: $profession, profileImagePath: $profileImagePath, backgroundImagePath: $backgroundImagePath, phone: $phone, email: $email, whatsapp: $whatsapp}';
  }
}