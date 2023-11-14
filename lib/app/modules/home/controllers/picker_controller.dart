import 'dart:ffi';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class controllerPicked extends GetxController {
  Rx<File?> img = Rx<File?>(null);

  Future<void> pickGallery() async {
    final Image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (Image != null) {
      img.value = File(Image.path);
    }
  }

  Future<void> pickCamera() async {
    final Image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (Image != null) {
      img.value = File(Image.path);
    }
  }
}
