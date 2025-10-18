// lib/weather_service.dart
import 'dart:async';

class WeatherService {
  /// Convert Celsius -> Fahrenheit
  double celsiusToFahrenheit(double celsius) => (celsius * 9 / 5) + 32;

  /// Convert Fahrenheit -> Celsius
  double fahrenheitToCelsius(double fahrenheit) => (fahrenheit - 32) * 5 / 9;

  /// Simulated API call (kept here so tests can mock/override easily)
  Future<Map<String, dynamic>?> fetchWeatherData(String city) async {
    await Future.delayed(const Duration(seconds: 2));

    if (city == 'Invalid City') {
      return null; // simulate invalid response
    }

    if (DateTime.now().millisecond % 4 == 0) {
      // return incomplete data sometimes
      return {'city': city, 'temperature': 22.5};
    }

    return {
      'city': city,
      'temperature': city == 'London' ? 15.0 : (city == 'Tokyo' ? 25.0 : 22.5),
      'description': city == 'London'
          ? 'Rainy'
          : (city == 'Tokyo' ? 'Cloudy' : 'Sunny'),
      'humidity': city == 'London' ? 85 : (city == 'Tokyo' ? 70 : 65),
      'windSpeed': city == 'London' ? 8.5 : (city == 'Tokyo' ? 5.2 : 12.3),
      'icon': city == 'London' ? '🌧️' : (city == 'Tokyo' ? '☁️' : '☀️'),
    };
  }

  /// Parse and validate JSON into WeatherData (throws on invalid/incomplete)
  WeatherData parseWeatherData(Map<String, dynamic>? json) {
    if (json == null) {
      throw Exception('Weather data is null');
    }

    // Required keys
    const requiredKeys = [
      'city',
      'temperature',
      'description',
      'humidity',
      'windSpeed',
      'icon',
    ];
    for (final k in requiredKeys) {
      if (!json.containsKey(k)) {
        throw Exception('Incomplete weather data: missing "$k"');
      }
    }

    return WeatherData(
      city: json['city'] as String,
      temperatureCelsius: (json['temperature'] as num).toDouble(),
      description: json['description'] as String,
      humidity: (json['humidity'] as num).toInt(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      icon: json['icon'] as String,
    );
  }
}

class WeatherData {
  final String city;
  final double temperatureCelsius;
  final String description;
  final int humidity;
  final double windSpeed;
  final String icon;

  WeatherData({
    required this.city,
    required this.temperatureCelsius,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
  });
}
