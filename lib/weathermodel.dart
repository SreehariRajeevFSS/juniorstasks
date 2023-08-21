class WeatherData {
  final double temperature;
  final String description;
  final double latitude;
  final double longitude;

  WeatherData({
    required this.temperature,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
      latitude: json['coord']['lat'],
      longitude: json['coord']['lon'],
    );
  }
}

