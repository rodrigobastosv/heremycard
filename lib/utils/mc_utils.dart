import 'dart:io';

import 'package:flutter/material.dart';

class MCUtils {
  static Image getImageByPathOrDefault(String path, String defaultAssetPath) {
    return path != null
        ? Image.file(
            File(path),
            fit: BoxFit.contain,
          )
        : Image.asset(defaultAssetPath);
  }

  static ImageProvider getImageProviderByPathOrDefault(
      String path, String defaultAssetPath) {
    return path != null ? FileImage(File(path)) : AssetImage(defaultAssetPath);
  }
}
