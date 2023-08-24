import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/gallary_controller.dart';



class GalleryScreen extends StatelessWidget {
  final GalleryController controller = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(
          child:  Text(
            'Gallery App',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            )
            ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: controller.captureImage,
                child: const Text(
                  'Open Camera',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            
            Obx(
              () => Column(
                children: controller.images.map((image) {
                  int index = controller.images.indexOf(image);
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(image),
                          ),
                          Positioned(
                            top: 10,
                            right: 20,
                            child: GestureDetector(
                              onTap: () => controller.deleteImage(index),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




