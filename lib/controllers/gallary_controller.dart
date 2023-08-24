import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class GalleryController extends GetxController {
  RxList<File> images = <File>[].obs;
  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    loadSavedImages();
  }

  Future<void> loadSavedImages() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? imagePaths = prefs.getStringList('images');
    if (imagePaths != null) {
      images.value = imagePaths.map((path) => File(path)).toList();
    }
  }

  Future<void> captureImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      images.add(File(image.path));
      saveImages();
    }
  }

  Future<void> saveImages() async {
    List<String> imagePaths = images.map((image) => image.path).toList();
    await prefs.setStringList('images', imagePaths);
  }

  void deleteImage(int index) {
    images.removeAt(index);
    saveImages();
  }
}