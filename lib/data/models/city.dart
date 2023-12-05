class City {
  final String? cityName;
  final List<dynamic>? temperature;
  final List<dynamic>? weather;
  City({
    this.cityName,
    this.temperature,
    this.weather,
  });

  factory City.fromJsonWithParameter(Map<String, dynamic> json) {
    return City(
      cityName: json['name'][1]['\$t'],
      temperature: json['parameter'][5]['timerange'],
      weather: json['parameter'][6]['timerange']
    );
  }

  factory City.fromJsonWithoutParameter(Map<String, dynamic> json) {
    return City(
      cityName: json['name'][1]['\$t'],
      temperature: null,
      weather: null
    );
  }

}
