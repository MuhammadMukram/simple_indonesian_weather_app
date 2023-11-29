import 'package:flutter/material.dart';
import 'data/api/weater_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final _weatherService = WeatherService();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try{
      _weatherService.getWeatherData("SulawesiSelatan");
    } catch (e) {
      Exception('Failed to fetch');
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(child: Center(child: Text("Hello World"),))
    );
  }
}
