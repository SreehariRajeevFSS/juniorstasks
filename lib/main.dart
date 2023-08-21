
import 'package:challenge/Weather/weather_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      
       home: WeatherPage(),
      
    );
  }
}




























