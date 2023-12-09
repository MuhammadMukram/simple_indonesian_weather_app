import 'dart:ui';

import 'package:logger/logger.dart';

class ColorConstants {
  static const kBgColor = Color(0xFFE1C6BF);
  static const kLightPurpleColor = Color(0xFFabadd7);
  static const kDarkPurpleColor = Color(0xFF5b6b9c);
  static const kLightOrangeColor = Color(0xFFf9b6a7);
  static const kDarkOrangeColor = Color(0xFFf59693);
  static const kWhite = Color.fromARGB(255, 255, 255, 255);

}

String mergeString(String str) {
  String mergedString = "";
  for (var element in str.split(" ")) {
    mergedString += element;
  }
  return mergedString;
}

var logger = Logger(
  printer: PrettyPrinter(),
);

List<String> provinceName = <String>[
  "Aceh",
  "Bali",
  "Bangka Belitung",
  "Banten",
  "Bengkulu",
  "DI Yogyakarta",
  "DKI Jakarta",
  "Gorontalo",
  "Jambi",
  "Jawa Barat",
  "Jawa Tengah",
  "Jawa Timur",
  "Kalimantan Barat",
  "Kalimantan Selatan",
  "Kalimantan Tengah",
  "Kalimantan Timur",
  "Kalimantan Utara",
  "Kepulauan Riau",
  "Lampung",
  "Maluku",
  "Maluku Utara",
  "Nusa Tenggara Barat",
  "Nusa Tenggara Timur",
  "Papua",
  "Papua Barat",
  "Riau",
  "Sulawesi Barat",
  "Sulawesi Selatan",
  "Sulawesi Tengah",
  "Sulawesi Tenggara",
  "Sulawesi Utara",
  "Sumatera Barat",
  "Sumatera Selatan",
  "Sumatera Utara"
];

List<String> timeValue = [
  "00:00 - 05:59",
  "06:00 - 11:59",
  "12:00 - 18:59",
  "18:00 - 23:59"
];

Map<String, String> weatherCode = {
  "0" : "Cerah / Clear Skies",
  "1" : "Cerah Berawan / Partly Cloudy",
  "2" : "Cerah Berawan / Partly Cloudy",
  "3" : "Berawan / Mostly Cloudy",
  "4" : "Berawan Tebal / Overcast",
  "5" : "Udara Kabur / Haze",
  "10" : "Asap / Smoke",
  "45" : "Kabut / Fog",
  "60" : "Hujan Ringan / Light Rain",
  "61" : "Hujan Sedang / Rain",
  "63" : "Hujan Lebat / Heavy Rain",
  "80" : "Hujan Lokal / Isolated Shower",
  "95" : "Hujan Petir / Severe Thunderstorm",
  "97" : "Hujan Petir / Severe Thunderstorm"
};