import 'package:get/get.dart';

import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class GalleryController extends GetxController {
  RxList<File> images = <File>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePaths = prefs.getStringList('imagePaths') ?? [];

    images.assignAll(imagePaths.map((path) => File(path)));
  }

  Future<void> captureImage() async {
    final imagePicker = ImagePicker();
    final imageFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      final imagePath = imageFile.path;
      final prefs = await SharedPreferences.getInstance();
      final imagePaths = prefs.getStringList('imagePaths') ?? [];
      imagePaths.add(imagePath);
      await prefs.setStringList('imagePaths', imagePaths);

      images.add(File(imagePath));
    }
  }

  Future<void> deleteImage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final imagePaths = prefs.getStringList('imagePaths') ?? [];
    final imagePathToRemove = images[index].path;
    imagePaths.remove(imagePathToRemove);
    await prefs.setStringList('imagePaths', imagePaths);

    images.removeAt(index);
  }
}
