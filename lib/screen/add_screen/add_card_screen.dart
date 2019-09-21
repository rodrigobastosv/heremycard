import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heremycard/components/text_formfield_with_padding.dart';
import 'package:heremycard/model/card_model.dart';
import 'package:heremycard/service/card_service.dart';
import 'package:heremycard/utils/mc_ui_utils.dart';
import 'package:image_picker/image_picker.dart';

import 'card_image_picker.dart';
import 'form_setters_mixin.dart';
import 'form_validators_mixin.dart';

class AddCardScreen extends StatefulWidget
    with FormSettersMixin, FormValidatorsMixin {
  AddCardScreen(this.card);

  final CardModel card;

  @override
  _AddCardScreenState createState() => _AddCardScreenState(card);
}

class _AddCardScreenState extends State<AddCardScreen> {
  _AddCardScreenState(this.cardModel);

  File _pickedProfileImage;
  File _pickedBackgroundImage;

  final cardModel;
  final form = GlobalKey<FormState>();
  final _service = CardService();

  bool get isEdit => cardModel.id != null;

  @override
  void initState() {
    super.initState();

    if (isEdit) {
      widget.setProfileImagePath(cardModel.profileImagePath);
      widget.setId(cardModel.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEdit ? Text('Edit Card') : Text('Add Card'),
        actions: <Widget>[
          IconButton(onPressed: _saveCard, icon: Icon(Icons.save)),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CardImagePicker(
                      imagePath: cardModel.profileImagePath,
                      pickedImage: _pickedProfileImage,
                      onPickImage: _pickProfileImage,
                      defaultAssetPath: 'assets/person.jpeg',
                    ),
                    CardImagePicker(
                      imagePath: cardModel.backgroundImagePath,
                      pickedImage: _pickedBackgroundImage,
                      onPickImage: _pickBackgroundImage,
                      defaultAssetPath: 'assets/logo.jpg',
                    ),
                  ],
                ),
                TextFormfieldWithPadding(
                  initialValue: cardModel.label,
                  label: 'Card Name',
                  setter: widget.labelSetter,
                  validator: widget.labelValidator,
                ),
                TextFormfieldWithPadding(
                  initialValue: cardModel.name,
                  label: 'Your Name',
                  setter: widget.nameSetter,
                  validator: widget.nameValidator,
                ),
                TextFormfieldWithPadding(
                  initialValue: cardModel.profession,
                  label: 'Profession',
                  setter: widget.professionSetter,
                  validator: widget.professionValidator,
                ),
                TextFormfieldWithPadding(
                  initialValue: cardModel.phone,
                  label: 'Phone',
                  setter: widget.phoneSetter,
                  inputType: TextInputType.phone,
                ),
                TextFormfieldWithPadding(
                  initialValue: cardModel.email,
                  label: 'E-mail',
                  setter: widget.emailSetter,
                ),
                TextFormfieldWithPadding(
                  initialValue: cardModel.whatsapp,
                  label: 'WhatsApp',
                  setter: widget.whatsappSetter,
                  inputType: TextInputType.phone,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pickProfileImage(ImageSource source) async {
    final image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _pickedProfileImage = image;
        widget.setProfileImagePath(_pickedProfileImage.path);
      });
    }
  }

  void _pickBackgroundImage(ImageSource source) async {
    final image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _pickedBackgroundImage = image;
        widget.setBackgroundImagePath(_pickedBackgroundImage.path);
      });
    }
  }

  void _saveCard() async {
    FormState formState = form.currentState;
    if (formState.validate()) {
      formState.save();
      if (isEdit) {
        await _service.update(FormSettersMixin.cardModel);
      } else {
        await _service.save(FormSettersMixin.cardModel);
      }
      MCUiUtils.showToast('Card Saved!');
      Navigator.pop(context);
    }
  }
}