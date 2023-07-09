import 'dart:convert';
import 'package:weather_app_timespade/models/weather_data.dart';
import 'package:weather_app_timespade/models/weather_data_current.dart';
import 'package:weather_app_timespade/models/weather_data_hourly.dart';
import 'package:weather_app_timespade/services/api/api_url.dart';
import 'package:http/http.dart' as http;

class ApiService {
  WeatherData? weatherResponse;
  Future<WeatherData> getData(lat, lon) async {
    Uri url = Uri.parse(apiUrl(lat, lon));
    var response = await http.get(url);
    var jsonString = jsonDecode(response.body);
    weatherResponse = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
    );
    return weatherResponse!;
  }
}
