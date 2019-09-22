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
  int pickedFontColor;

  bool get isEdit => cardModel.id != null;

  @override
  void initState() {
    super.initState();

    if (isEdit) {
      widget.setId(cardModel.id);
      widget.setProfileImagePath(cardModel.profileImagePath);
      pickedFontColor = cardModel.fontColor;
    } else {
      pickedFontColor = 0xFF000000;
    }
    widget.setFontColor(pickedFontColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: isEdit ? Text('Edit Card') : Text('Add Card'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              icon: Icon(Icons.done),
              label: Text('Save'),
              color: Colors.green[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: _saveCard,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                _buildImagesPicker(),
                SizedBox(
                  height: 16.0,
                ),
                _buildColorPicker(),
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

  Widget _buildColorPicker() {
    return GestureDetector(
      onTap: () {
        MCUiUtils.showColorPicker(
          context: context,
          pickedColor: Color(pickedFontColor),
          onPickColor: (Color color) {
            setState(() => pickedFontColor = color.value);
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey[100]),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Font Color:',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.0),
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Color(pickedFontColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagesPicker() {
    return Wrap(
      spacing: 12.0,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[100]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Profile:',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              CardImagePicker(
                imagePath: cardModel.profileImagePath,
                pickedImage: _pickedProfileImage,
                onPickImage: _pickProfileImage,
                defaultAssetPath: 'assets/person.jpeg',
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[100]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Background:',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              CardImagePicker(
                imagePath: cardModel.backgroundImagePath,
                pickedImage: _pickedBackgroundImage,
                onPickImage: _pickBackgroundImage,
                defaultAssetPath: 'assets/logo.jpg',
              ),
            ],
          ),
        ),
      ],
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
      widget.setFontColor(pickedFontColor);
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
