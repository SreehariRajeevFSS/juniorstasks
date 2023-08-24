import 'dart:io';

import 'package:challenge/controller/gallery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});

  GalleryController galleryController = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        centerTitle: true,
        title: Text(
          'Gallery App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                galleryController.getImage(ImageSource.camera);
              },
              icon: Icon(Icons.camera_alt, color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: galleryController.myImageList.isEmpty,
                child: Center(
                  child: Text(
                    'Please capture an image',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                replacement: Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: galleryController.myImageList.length,
                    itemBuilder: (context, index) {
                      // final fileSize =galleryController.getFileSize(imagepath);
                      final imagePath = galleryController.myImageList[index];
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(
                              File(imagePath),
                              
                            ),
                            fit: BoxFit.cover
                          ),
                        ),
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              galleryController.deleteImage(imagePath);
                            },
                            icon: Icon(Icons.delete, color: Colors.white)),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
