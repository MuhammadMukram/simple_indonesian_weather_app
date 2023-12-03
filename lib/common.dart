import 'dart:ui';

import 'package:logger/logger.dart';

class ColorConstants {
  static const kBgColor = Color.fromARGB(255, 225, 198, 191);
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

