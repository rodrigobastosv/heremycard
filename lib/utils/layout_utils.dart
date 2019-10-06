import 'package:heremycard/enum/layout.dart';

import 'mc_form_fields.dart';

bool layoutAcceptField(Layout layout, MCFormField field) {
  bool accept;
  switch(layout) {
    case Layout.basicWithProfile: {
      switch(field) {
        case MCFormField.layout:
        case MCFormField.profilePhoto:
        case MCFormField.backgroundImage:
        case MCFormField.fontColor:
        case MCFormField.fontSize:
        case MCFormField.cardName:
        case MCFormField.name:
        case MCFormField.profession:
        case MCFormField.phone:
        case MCFormField.email:
        case MCFormField.whatsapp:
          accept = true;
          break;
        case MCFormField.brand:
          accept = false;
          break;
      }
      return accept;
    }
    case Layout.basicWithProfileAndBrand: {
      switch(field) {
        case MCFormField.layout:
        case MCFormField.profilePhoto:
        case MCFormField.brand:
        case MCFormField.backgroundImage:
        case MCFormField.fontColor:
        case MCFormField.fontSize:
        case MCFormField.cardName:
        case MCFormField.name:
        case MCFormField.profession:
        case MCFormField.phone:
        case MCFormField.email:
        case MCFormField.whatsapp:
          accept = true;
      }
      return accept;
    }
    case Layout.profileEmphasys: {
      switch(field) {
        case MCFormField.layout:
        case MCFormField.profilePhoto:
        case MCFormField.backgroundImage:
        case MCFormField.fontColor:
        case MCFormField.fontSize:
        case MCFormField.cardName:
        case MCFormField.name:
        case MCFormField.profession:
        case MCFormField.phone:
        case MCFormField.email:
        case MCFormField.whatsapp:
          accept = true;
          break;
        case MCFormField.brand:
          accept = false;
          break;
      }
      return accept;
    }
    case Layout.brandEmphasys: {
      switch(field) {
        case MCFormField.layout:
        case MCFormField.brand:
        case MCFormField.backgroundImage:
        case MCFormField.fontColor:
        case MCFormField.fontSize:
        case MCFormField.cardName:
        case MCFormField.name:
        case MCFormField.profession:
        case MCFormField.phone:
        case MCFormField.email:
        case MCFormField.whatsapp:
          accept = true;
          break;
        case MCFormField.profilePhoto:
          accept = false;
          break;
      }
      return accept;
    }
  }
  return true;
}