// ignore_for_file: public_member_api_docs, sort_constructors_first
// {"Cerah", "Cerah Berawan", "Berawan", "Kabut", "Berasap", "Hujan Ringan", "Hujan Sedang", "Hujan Lebat / Petir"}
class City {
  final String? cityName;
  final Map<String, double>? temperature;
  final Map<String, int>? weather;
  City({
    this.cityName,
    this.temperature,
    this.weather,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityName: json['name'][1]['\$t'],
      

    );
  }
}
