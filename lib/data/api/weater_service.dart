import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_indonesian_weather_app/data/models/city.dart';
import 'package:xml2json/xml2json.dart';
import '../const.dart';
import 'package:logger/logger.dart';

class WeatherService {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  getWeatherData(String provinceName) async {
    final response = await http.get(Uri.parse('$baseURL/DigitalForecast-$provinceName.xml'));

    if (response.statusCode == 200) {
      logger.d("success: ${response.statusCode}" );
      logger.d(response.body.runtimeType);
      logger.d(jsonDecode(jsonConverter(response.body))['data']['forecast']['area']);
      List<dynamic> listCity = jsonDecode(jsonConverter(response.body))['data']['forecast']['area'];

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
