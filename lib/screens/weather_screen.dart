import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/weather_controller.dart';


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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Obx(
                () => DropdownButton<String>(
                  value: _weatherController.selectedCity.value,
                  onChanged: (newValue) {
                    if (_weatherController.allIndianCities.contains(newValue)) {
                      _weatherController.selectedCity.value = newValue!;
                      _weatherController.getWeatherData();
                    } else {
                      _weatherController.showCityNotFoundError();
                    }
                  },
                  items: _weatherController.allIndianCities.map<DropdownMenuItem<String>>(
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
                  final weatherData = _weatherController.weatherData.value;

                  if (weatherData != null) {
                    final temperatureInCelsius = weatherData.temperature - 273.15;

                    return Column(
                      children: [
                        if (weatherData.temperature != 0.0)
                          Text(
                            'Temperature: ${temperatureInCelsius.toStringAsFixed(2)} °C',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                        Text(
                          'Description: ${weatherData.description}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          'Latitude: ${weatherData.latitude}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          'Longitude: ${weatherData.longitude}',
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
      ),
    );
  }
}



