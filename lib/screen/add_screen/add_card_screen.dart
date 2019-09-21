import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heremycard/model/card_model.dart';
import 'package:heremycard/service/card_service.dart';
import 'package:image_picker/image_picker.dart';

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

  File _pickedImage;

  final cardModel;
  final form = GlobalKey<FormState>();
  final _service = CardService();

  bool get isEdit => cardModel.id != null;

  @override
  void initState() {
    super.initState();

    if (isEdit) {
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
                CardProfileImagePicker(cardModel.profileImagePath, _pickedImage, _pickImage),
                _buildFormFieldWithPadding(
                  initialValue: cardModel.label,
                    label: 'Card Name',
                    setter: widget.labelSetter,
                    validator: widget.labelValidator),
                _buildFormFieldWithPadding(
                    initialValue: cardModel.name,
                    label: 'Your Name',
                    setter: widget.nameSetter,
                    validator: widget.nameValidator),
                _buildFormFieldWithPadding(
                    initialValue: cardModel.profession,
                    label: 'Profession',
                    setter: widget.professionSetter,
                    validator: widget.professionValidator),
                _buildFormFieldWithPadding(
                    initialValue: cardModel.phone,
                    label: 'Phone', setter: widget.phoneSetter, isText: false),
                _buildFormFieldWithPadding(
                    initialValue: cardModel.email,
                    label: 'E-mail', setter: widget.emailSetter),
                _buildFormFieldWithPadding(
                    initialValue: cardModel.whatsapp,
                    label: 'WhatsApp',
                    setter: widget.whatsappSetter,
                    isText: false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFieldWithPadding(
      {String initialValue = '',
      String label,
      FormFieldSetter<String> setter,
      FormFieldValidator<String> validator,
      bool isText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        initialValue: initialValue,
        validator: validator,
        onSaved: setter,
        keyboardType: isText ? TextInputType.text : TextInputType.phone,
      ),
    );
  }

  void _pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _pickedImage = image;
        widget.setProfileImagePath(_pickedImage.path);
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
    }
  }
}

class CardProfileImagePicker extends StatelessWidget {

  CardProfileImagePicker(this.profileImagePath, this._pickedImage, this.onPickImage);

  final String profileImagePath;
  final File _pickedImage;
  final Function onPickImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPickImage,
      child: CircleAvatar(
        radius: 90.0,
        backgroundImage: _buildImage(),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  ImageProvider _buildImage() {
    if (_pickedImage == null && profileImagePath == null) {
      return AssetImage('assets/person.jpeg');
    }
    if (_pickedImage != null) {
      return FileImage(_pickedImage);
    }
    return FileImage(File(profileImagePath));
  }
}
