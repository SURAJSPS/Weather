import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:weather/model/model.dart';


class DataService extends GetxController  {
  Future<WeatherResponse> getWeather(String city) async {





    final queryParameters = {
      'q': city,
      'appid': '98e8dfcf4ea2319b693eb4c58b2a6018',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}