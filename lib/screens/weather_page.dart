import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/weather_controller.dart';

class WeatherPage extends StatelessWidget {
  final WeatherController weathercontroller = Get.put(WeatherController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.sunny,
                    color: Colors.amber,
                    size: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Today Weather",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: weathercontroller.cityNameController,
                  decoration: const InputDecoration(
                      labelText: ' Enter City Name',
                      labelStyle: TextStyle(fontSize: 25, color: Colors.black)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter the CityName';
                    }
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  final cityName =
                      weathercontroller.cityNameController.text.trim();
                  if (formKey.currentState!.validate()) {
                    if (cityName.isNotEmpty) {
                      weathercontroller.fetchWeatherData(cityName, context);
                    } else {}
                  }
                },
                child: const Text(
                  'Get Weather',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Obx(() {
                final weatherData = weathercontroller.weatherData.value;
                if (weatherData == null) {
                  return const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'No weather data  is available.',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Temperature: ${(weatherData.temperature - 273.15).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          'Description: ${weatherData.description}',
                          style: const TextStyle(
                            fontSize: 27,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Latitude: ${weatherData.latitude}',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.pink,
                          ),
                        ),
                        Text(
                          'Longitude: ${weatherData.longitude}',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.amber,
                          ),
                        ),
                        Text(
                          'City Name: ${weatherData.cityName}',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
