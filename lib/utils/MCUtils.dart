import 'dart:io';

import 'package:flutter/material.dart';

class MCUtils {
  static Image getProfileImageByPathOrDefault(String path) {
    return path != null
        ? Image.file(
            File(path),
            fit: BoxFit.contain,
          )
        : Image.asset('assets/person.jpeg');
  }
}
