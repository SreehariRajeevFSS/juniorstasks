import 'package:get/get.dart';
import 'package:dio/dio.dart';

class WeatherController extends GetxController {
  RxBool isLoading = false.obs;
  RxMap weatherData = {}.obs;

  Future<void> fetchWeatherByCityName(String cityName) async {
    isLoading.value = true;

    final apiKey = '24dca1ed71101729fcd3cc49d9c9257b';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';

    try {
      final response = await Dio().get(apiUrl);

      if (response.statusCode == 200) {
        weatherData.value = response.data;
      } else {
        
        print('Failed to fetch weather data');
      }
    } catch (e) {
      
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}