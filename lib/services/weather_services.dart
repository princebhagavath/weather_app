import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class Weather_Services {
  Future<WeatherModel> fetch(String query) async {
    String api_key = "8aeca15d8d76485b81170724222003";
    String url = "http://api.weatherapi.com/v1";
    var model;
    String myUrl =
        "http://api.weatherapi.com/v1/current.json?key=$api_key&q=$query&aqi=no";
    var client = http.Client();
    var response = await http.get(Uri.parse(myUrl));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = jsonDecode(jsonString);
      model = WeatherModel.fromJson(jsonMap);
    }

    return model;
  }
}
