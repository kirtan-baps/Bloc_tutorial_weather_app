import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_tutorial_weather_app_5/secrets.dart';

class WeatherDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try {
      // String cityName = 'Gujarat';
      // String cityName = 'Ahmedabad';
      // String cityName = 'Navrangpura';
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      // final data = jsonDecode(res.body);

      // if (data['cod'] != '200') {
      //   throw 'An unexpected error occurred';
      // }

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
