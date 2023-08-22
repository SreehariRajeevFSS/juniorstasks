class WeatherModel {
  final double temperature;
  final String description;
  final double latitude;
  final double longitude;
  final String cityName; 

  WeatherModel({
    required this.temperature,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.cityName, 
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['main']['temp'] ,
      description: json['weather'][0]['description'] ,
      latitude: json['coord']['lat'] ,
      longitude: json['coord']['lon'],
      cityName: json['name'] , 
    );
  }
}
