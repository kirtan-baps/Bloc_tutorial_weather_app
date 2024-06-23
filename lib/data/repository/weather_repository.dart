import 'dart:convert';

import 'package:bloc_tutorial_weather_app_5/data/data_provider/weather_data_provider.dart';
import 'package:bloc_tutorial_weather_app_5/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      // String cityName = 'Gujarat';
      // String cityName = 'Ahmedabad';
      String cityName = 'Navrangpura';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

// Both will Work
      // return WeatherModel.fromJson(weatherData);
      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
