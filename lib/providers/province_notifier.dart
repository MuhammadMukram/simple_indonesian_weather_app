
import 'package:flutter/material.dart';

import '../data/models/city.dart';

class ProvinceNotifier extends ChangeNotifier {
  String _provinceName = "";

  List<City> _listCity = List.empty();

  List<City> get listCity => _listCity;

  String get provinceName => _provinceName;

  void setListCity(List<City> value) {
    _listCity = value;
    notifyListeners();
  }

  void setProvinceName(String value) {
    _provinceName = value;
    notifyListeners();
  }
}