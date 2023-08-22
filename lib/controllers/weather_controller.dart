


import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/weather_model.dart';

class WeatherController extends GetxController {
  final TextEditingController cityNameController = TextEditingController();

  final String apiKey = '24dca1ed71101729fcd3cc49d9c9257b';
  

  var weather = WeatherModel(
    temperature: 0,
    description: "",
    latitude: 0,
    longitude: 0,
    cityName: "",
  ).obs;

  Rx<WeatherModel?> weatherData = Rx<WeatherModel?>(null);

  void fetchWeatherData(String cityName, BuildContext context) async {
   
    
    try {
      final response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final weatherModel = WeatherModel.fromJson(data);
        weatherData.value = weatherModel;
      } else {
        Get.snackbar('Error', 'Failed to fetch weather data');
        
      }
    } catch (e) {
     
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the correct city name'),
          backgroundColor: Colors.red,
        ),
        
      );
       weatherData.value = null;

    }
  }
}
