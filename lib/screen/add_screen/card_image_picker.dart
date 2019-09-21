import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heremycard/utils/mc_ui_utils.dart';
import 'package:image_picker/image_picker.dart';

class CardImagePicker extends StatelessWidget {
  CardImagePicker(
      {this.imagePath,
      this.pickedImage,
      this.onPickImage,
      this.defaultAssetPath});

  final String imagePath;
  final String defaultAssetPath;
  final File pickedImage;
  final Function onPickImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MCUiUtils.showSimpleDialog(
            context: context,
            title: Text('Choose the image source'),
            children: <Widget>[
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () =>
                            chooseSource(context, ImageSource.camera),
                        icon: Icon(Icons.camera_alt),
                      ),
                      Text('Camera'),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () =>
                            chooseSource(context, ImageSource.gallery),
                        icon: Icon(Icons.photo),
                      ),
                      Text('Gallery'),
                    ],
                  ),
                ],
              ),
            ]);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90.0),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 1, offset: Offset(0, 1)),
          ],
        ),
        child: CircleAvatar(
          radius: 60.0,
          backgroundImage: _buildImage(),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  void chooseSource(BuildContext context, ImageSource source) {
    Navigator.pop(context);
    onPickImage(source);
  }

  ImageProvider _buildImage() {
    if (pickedImage == null && imagePath == null) {
      return AssetImage(defaultAssetPath);
    }
    if (pickedImage != null) {
      return FileImage(pickedImage);
    }
    return FileImage(
      File(imagePath),
    );
  }
}
