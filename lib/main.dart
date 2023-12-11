import 'package:flutter/material.dart';
import 'package:simple_indonesian_weather_app/presentation/homepage.dart';
import 'data/api/weater_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato'
      ),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: HomePage())
    );
  }
}
