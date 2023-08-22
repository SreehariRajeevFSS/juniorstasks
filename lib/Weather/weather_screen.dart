import 'package:challenge/Weather/Weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherPage extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());
  final TextEditingController cityNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a city name';
                  }
                  if (value.contains(' ')) {
                    return 'Cant be empty';
                  }
                  return null; 
                  
                },
                
                controller: cityNameController,
                decoration: InputDecoration(labelText: 'Enter City Name'),
              ),
              
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  
                    final cityName =
                        cityNameController.text.removeAllWhitespace;

                    if (cityName.isNotEmpty) {
                      weatherController.fetchWeatherByCityName(cityName,context);
                    } else {
                     
                    }
                  }
                },
                child: Text('Get Weather'),
              ),
              
              SizedBox(
                height: 10,
              ),
              Obx(
                () => weatherController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : WeatherInfoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherInfoWidget extends StatelessWidget {
  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    final weatherData = weatherController.weatherData;

    if (weatherData.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              'Location: ${weatherData['name']}, ${weatherData['sys']['country']}'),
          Text(
              'Temperature: ${(weatherData['main']['temp'] - 273.15).toStringAsFixed(2)}°C'),
          Text('Weather: ${weatherData['weather'][0]['description']}'),
        ],
      );
    } else {
      return SizedBox();
      //return Text('Enter a valid city name to get weather data');
    }
  }
}
