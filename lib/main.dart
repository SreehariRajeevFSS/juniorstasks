

import 'package:challenge/screen/instagram_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      
       debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData(
        useMaterial3: true,
      //  primarySwatch: Colors.blue
        ),
      
       home: InstagramUi(),
      
    );
  }
}




























