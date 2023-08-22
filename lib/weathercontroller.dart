
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'weathermodel.dart';

class WeatherController extends GetxController {
  final String apiKey = '24dca1ed71101729fcd3cc49d9c9257b';
  var selectedCity = 'Tirupati'.obs;
  var weatherData = WeatherData(
    temperature: 0.0,
    description: '',
    latitude: 0.0,
    longitude: 0.0,
  ).obs;

  List<String> allIndianCities = [
    'Tirupati',
    'Mumbai',
    'Delhi',
    'Chennai',
    'Nellore',
    'Bangalore',
    'Hyderabad',
    'India',
    'Chittoor',
    'America',
    'Rayachoti',
    'Guntur',
    'Madanapalle',
    'hsdfdfhj',
    'fhhadfjj',
    'dbhasbds',
  ];

  Future<void> getWeatherData() async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=${selectedCity.value}&appid=$apiKey',
      );

      if (response.statusCode == 200) {
        weatherData.value = WeatherData.fromJson(response.data);
      } else {
        showCityNotFoundError();
      }
    } catch (error) {
      showCityNotFoundError();
    }
  }

  void showCityNotFoundError() {
    Get.snackbar(
      'City Not Found',
      'Please select a correct city name',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
    weatherData.value = WeatherData(
      temperature: 0.0,
      description: '',
      latitude: 0.0,
      longitude: 0.0,
    );
    
  }

  @override
  void onInit() {
    super.onInit();
    getWeatherData();
  }
}


