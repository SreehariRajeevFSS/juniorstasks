

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
      theme: ThemeData(primarySwatch: Colors.blue),
      //home: SiginScreen(),
    //   home: LoginPage(),
      
    );
  }
}




























