import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/weathercontroller.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherController _weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Weather App',
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => DropdownButton<String>(
                value: _weatherController.selectedCity.value,
                onChanged: (newValue) {
                  _weatherController.selectedCity.value = newValue!;
                  _weatherController.getWeatherData();
                },
                items: <String>[
                  'Tirupati',
                  'Nellore',
                  'Hyd',
                  'Piler',
                  'Bangalore',
                  'London',
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () {
                if (_weatherController.weatherData.value != null) {
                  return Column(
                    children: [
                      Text(
                        'Temperature: ${(_weatherController.weatherData.value.temperature-273.15).toStringAsFixed(2)} °C',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        'Description: ${_weatherController.weatherData.value.description}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Latitude: ${_weatherController.weatherData.value.latitude}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Longitude: ${_weatherController.weatherData.value.longitude}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text(
                    'Loading weather data...',
                    style: TextStyle(fontSize: 20),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}





