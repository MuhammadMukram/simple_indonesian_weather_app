import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_indonesian_weather_app/data/models/temperature.dart';

import '../common.dart';
import '../data/models/city.dart';

class CityDetail extends StatelessWidget {
  final City city;
  const CityDetail({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          title: const Text(
            "Detail Kota",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
          ],
          backgroundColor: ColorConstants.kDarkPurpleColor,
        ),
        backgroundColor: ColorConstants.kBgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  city.cityName!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorConstants.kDarkPurpleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: List.generate(4, (index) {
                      String weather = city.weather![index]["value"]["\$t"];
                      List temperature = city.temperature![index]["value"];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: ColorConstants.kWhite,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(10, 0, 0, 0),
                                    blurRadius: 5.0,
                                    offset: Offset(2, 2))
                              ]),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              
                              Text(
                                "${weatherCode[weather]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Temperature",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${temperature[0]["\$t"]} °C"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text("${temperature[1]["\$t"]} °F"),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Time",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(timeValue[index]),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(12.0),
//                         child: Container(
//                           decoration: const BoxDecoration(
//                               color: ColorConstants.kWhite,
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Color.fromARGB(10, 0, 0, 0),
//                                     blurRadius: 5.0,
//                                     offset: Offset(2, 2))
//                               ]),
//                           padding: const EdgeInsets.all(8),
//                           child: const Text("He'd have you all unravel at the"),
//                         ),
//                       ),
//                     ],
// Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(12.0),
//                         child: Container(
//                           decoration: const BoxDecoration(
//                               color: ColorConstants.kWhite,
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Color.fromARGB(10, 0, 0, 0),
//                                     blurRadius: 5.0,
//                                     offset: Offset(2, 2))
//                               ]),
//                           padding: const EdgeInsets.all(8),
//                           child: const Text("He'd have you all unravel at the"),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 5.0),
//                     Expanded(
//                       flex: 1,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(12.0),
//                         child: Container(
//                           decoration: const BoxDecoration(
//                               color: ColorConstants.kWhite,
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Color.fromARGB(10, 0, 0, 0),
//                                     blurRadius: 5.0,
//                                     offset: Offset(2, 2))
//                               ]),
//                           padding: const EdgeInsets.all(8),
//                           child: const Text("He'd have you all unravel at the"),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
