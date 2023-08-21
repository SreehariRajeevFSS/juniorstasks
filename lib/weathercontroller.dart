import 'package:dio/dio.dart';
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

  Future<void> getWeatherData() async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=${selectedCity.value}&appid=$apiKey',
      );

      if (response.statusCode == 200) {
        weatherData.value = WeatherData.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      throw Exception('An error occurred. Please try again later.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getWeatherData();
  }
}
