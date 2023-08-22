

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class WeatherController extends GetxController {
  RxBool isLoading = false.obs;
  RxMap weatherData = {}.obs;

  Future<void> fetchWeatherByCityName(String cityName,BuildContext context) async {
    weatherData.clear();
    isLoading.value = true;

    final apiKey = '24dca1ed71101729fcd3cc49d9c9257b';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    print(apiUrl);
    try {
      final response = await Dio().get(apiUrl);
      print(response.data);
      if (response.statusCode == 200) {
        weatherData.value = response.data;
        Get.snackbar("Success", "Weather data fetched successfully");
      } else {
        Get.snackbar("Error", "Failed to fetch weather data");
        print('Failed to fetch weather data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter the correct city name'),backgroundColor: Colors.red,));
      // Get.snackbar("Error", "Please enter the correct city name",
      //     backgroundColor: Colors.red);
      log('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}



