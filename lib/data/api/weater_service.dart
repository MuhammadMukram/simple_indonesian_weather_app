import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_indonesian_weather_app/common.dart';
import 'package:simple_indonesian_weather_app/data/models/city.dart';
import 'package:xml2json/xml2json.dart';
import '../const.dart';

class WeatherService {
  Future<List<City>> getWeatherData(String provinceName) async {
    final response =
        await http.get(Uri.parse('$baseURL/DigitalForecast-$provinceName.xml'));

    if (response.statusCode == 200) {

      List<dynamic> rawCityList =
          jsonDecode(jsonConverter(response.body))['data']['forecast']['area'];

      List<City> cityList = [];

      for (var item in rawCityList) {
        City temp = item['parameter'] != null
            ? City.fromJsonWithParameter(item)
            : City.fromJsonWithoutParameter(item);
        cityList.add(temp);
      }

      return cityList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  jsonConverter(String xmlData) {
    var converter = Xml2Json();
    converter.parse(xmlData);
    return converter.toGData();
  }
}
