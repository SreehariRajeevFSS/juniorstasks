import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GalleryController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  RxList myImageList = [].obs;

  void getImage(ImageSource imageSource) async {
    final PickedFile = await ImagePicker().pickImage(source: imageSource);
    if (PickedFile != null) {
      selectedImagePath.value = PickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";
      print('its capture the image');
      myImageList.add(selectedImagePath.value);
      String myData = json.encode(myImageList);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('imagepath', myData);
    } else {
      print('object');
      Get.snackbar("Error", "No image found", backgroundColor: Colors.red);
    }
  }

  void fetchImage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? loadedData = sharedPreferences.getString("imagepath");
    print(loadedData);
    myImageList.value = jsonDecode(loadedData!);
  }

 
  double getFileSize(String imagePath) {
    final fileSizeBytes = File(imagePath).lengthSync();
    final fileSizeMB = fileSizeBytes / (1024 * 1024); // Convert to megabytes
    return fileSizeMB;
  }

  void deleteImage(String imagePath) async {
    print("Deleted");
    myImageList.remove(imagePath);
    String myData = json.encode(myImageList);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('imagepath', myData);
  }

  @override
  void onInit() {
    super.onInit();

    fetchImage();
  }


}