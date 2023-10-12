import 'dart:convert';

import 'package:project/model/weather_response/weather_response.dart';
import 'package:http/http.dart' as http;

Future<WeatherResponse> getWeather(String location) async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e100293d4f04d615d269405417e0c7ca'));
  final data = jsonDecode(response.body);
  final weather = WeatherResponse.fromJson(data);
  return weather;
}
