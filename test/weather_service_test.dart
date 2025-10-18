// test/weather_utils_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/widgets/weather_service.dart';

void main() {
  late WeatherService service;

  setUp(() {
    service = WeatherService();
  });

  test('Celsius to Fahrenheit conversion', () {
    expect(service.celsiusToFahrenheit(0), 32);
    expect(service.celsiusToFahrenheit(100), 212);
    expect(service.celsiusToFahrenheit(-40), -40);
  });

  test('Fahrenheit to Celsius conversion', () {
    expect(service.fahrenheitToCelsius(32).round(), 0);
    expect(service.fahrenheitToCelsius(212).round(), 100);
    expect(service.fahrenheitToCelsius(-40).round(), -40);
  });

  test('parseWeatherData throws on null', () {
    expect(() => service.parseWeatherData(null), throwsException);
  });

  test('parseWeatherData throws on incomplete data', () {
    final incomplete = {'city': 'Test'};
    expect(() => service.parseWeatherData(incomplete), throwsException);
  });

  test('parseWeatherData parses valid data', () {
    final json = {
      'city': 'Cairo',
      'temperature': 30.0,
      'description': 'Sunny',
      'humidity': 20,
      'windSpeed': 5.5,
      'icon': '☀️',
    };

    final wd = service.parseWeatherData(json);
    expect(wd.city, 'Cairo');
    expect(wd.temperatureCelsius, 30.0);
    expect(wd.description, 'Sunny');
    expect(wd.humidity, 20);
    expect(wd.windSpeed, 5.5);
    expect(wd.icon, '☀️');
  });
}
