import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

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
            child: Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 3 / 5,
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
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Lottie.asset(
                                      '${weatherCode[weather]![1]}'),
                                ),
                                Text(
                                  "${weatherCode[weather]![0]}",
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Time",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      timeValue[index],
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
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
                                          fontSize: 12),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${temperature[0]["\$t"]} °C",
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${temperature[1]["\$t"]} °F",
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
