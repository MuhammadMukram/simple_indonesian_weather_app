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

Map<String, List> weatherCode = {
  "0": [
    "Cerah / Clear Skies",
    "assets/animations/animation1.json",
  ],
  "1": [
    "Cerah Berawan / Partly Cloudy",
    "assets/animations/animation1.json",
  ],
  "2": [
    "Cerah Berawan / Partly Cloudy",
    "assets/animations/animation2.json",
  ],
  "3": [
    "Berawan / Mostly Cloudy",
    "assets/animations/animation3.json",
  ],
  "4": [
    "Berawan Tebal / Overcast",
    "assets/animations/animation3.json",
  ],
  "5": [
    "Udara Kabur / Haze",
    "assets/animations/animation6.json",
  ],
  "10": [
    "Asap / Smoke",
    "assets/animations/animation6.json",
  ],
  "45": [
    "Kabut / Fog",
    "assets/animations/animation6.json",
  ],
  "60": [
    "Hujan Ringan / Light Rain",
    "assets/animations/animation4.json",
  ],
  "61": [
    "Hujan Sedang / Rain",
    "assets/animations/animation4.json",
  ],
  "63": [
    "Hujan Lebat / Heavy Rain",
    "assets/animations/animation5.json",
  ],
  "80": [
    "Hujan Lokal / Isolated Shower",
    "assets/animations/animation4.json",
  ],
  "95": [
    "Hujan Petir / Severe Thunderstorm",
    "assets/animations/animation5.json",
  ],
  "97": [
    "Hujan Petir / Severe Thunderstorm",
    "assets/animations/animation5.json",
  ]
};
