// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'package:simple_indonesian_weather_app/common.dart';
import 'package:simple_indonesian_weather_app/data/api/weater_service.dart';
import 'package:simple_indonesian_weather_app/data/models/city.dart';
import 'package:simple_indonesian_weather_app/presentation/city_detail.dart';
import 'package:simple_indonesian_weather_app/providers/province_notifier.dart';

Map<String, String> provinceLabels = {};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? dropdownValue;

  final TextEditingController textEditingController = TextEditingController();

  final provinceNotifier = ProvinceNotifier();

  final _weatherService = WeatherService();

  _fetchCity(String province) async {
    try {
      final listCity = await _weatherService.getWeatherData(province);
      setState(() {
        provinceNotifier.setListCity(listCity);
      });
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (var element in provinceName) {
      provinceLabels[element] = mergeString(element);
    }
    return ChangeNotifierProvider(
      create: (context) => ProvinceNotifier(),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 65,
              title: const Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.info_outline)),
              ],
              backgroundColor: ColorConstants.kDarkPurpleColor,
            ),
            backgroundColor: ColorConstants.kBgColor,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          "Pilih Provinsi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            items: provinceName
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          color: ColorConstants.kWhite),
                                    ),
                                  ),
                                )
                                .toList(),
                            isExpanded: true,
                            value: dropdownValue,
                            hint: const Text(
                              "Pilih Provinsi",
                              style: TextStyle(
                                  color: ColorConstants.kLightPurpleColor),
                            ),
                            onChanged: (value) => setState(() {
                              dropdownValue = value;
                              provinceNotifier.setProvinceName(value!);
                              provinceNotifier.setListCity(List.empty());
                              _fetchCity(
                                  mergeString(provinceNotifier.provinceName));
                            }),
                            iconStyleData: const IconStyleData(
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                              iconSize: 24,
                              iconEnabledColor:
                                  ColorConstants.kLightOrangeColor,
                            ),
                            buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: ColorConstants.kWhite,
                                  width: 1,
                                ),
                                color: ColorConstants.kDarkPurpleColor,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              elevation: 2,
                              // height: 40,
                            ),
                            dropdownStyleData: const DropdownStyleData(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: ColorConstants.kDarkPurpleColor),
                              maxHeight: 200,
                              offset: Offset(0, -5),
                            ),
                            dropdownSearchData: DropdownSearchData(
                              searchController: textEditingController,
                              searchInnerWidgetHeight: 50,
                              searchInnerWidget: Container(
                                height: 60,
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 4,
                                  right: 8,
                                  left: 8,
                                ),
                                child: TextFormField(
                                  expands: true,
                                  maxLines: null,
                                  controller: textEditingController,
                                  style: const TextStyle(
                                      color: ColorConstants.kWhite),
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorConstants.kLightPurpleColor,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorConstants.kWhite,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    hintText: 'Search for an item...',
                                    hintStyle: const TextStyle(
                                        color: ColorConstants.kWhite),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //This to clear the search value when you close the menu
                            onMenuStateChange: (isOpen) {
                              if (!isOpen) {
                                textEditingController.clear();
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        provinceNotifier.provinceName != ""
                            ? CityList(listCity: provinceNotifier.listCity)
                            : const Text("Pilih Provinsi Terlebih Dahulu")
                      ],
                    ),
                  ),
                ),
              ),
            ));
      }),
    );
  }
}

class CityList extends StatefulWidget {
  final List<City> listCity;
  const CityList({
    Key? key,
    required this.listCity,
  }) : super(key: key);

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  final _scrollController = ScrollController();
  

  @override
  Widget build(BuildContext context) {
    // widget.listCity.isNotEmpty
    //     ? logger.d(widget.listCity[2].cityName)
    //     : logger.d("Data Kosong");
    return (widget.listCity.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(15),
              color: ColorConstants.kWhite,
              child: Scrollbar(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: widget.listCity.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SingleChildScrollView( 
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return CityDetail(city: widget.listCity[index]);
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  widget.listCity[index].cityName!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: ColorConstants.kDarkPurpleColor),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const CircularProgressIndicator());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
}

// class ProvinceDropdown extends StatefulWidget {
//   const ProvinceDropdown({
//     super.key,
//   });

//   @override
//   State<ProvinceDropdown> createState() => _ProvinceDropdownState();
// }

// class _ProvinceDropdownState extends State<ProvinceDropdown> {
//   String? dropdownValue;

//   final TextEditingController textEditingController = TextEditingController();

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<String>(
//         items: provinceName
//             .map(
//               (item) => DropdownMenuItem(
//                 value: item,
//                 child: Text(
//                   item,
//                   style: const TextStyle(color: ColorConstants.kWhite),
//                 ),
//               ),
//             )
//             .toList(),
//         isExpanded: true,
//         value: dropdownValue,
//         hint: const Text(
//           "Pilih Provinsi",
//           style: TextStyle(color: ColorConstants.kLightPurpleColor),
//         ),
//         onChanged: (value) => setState(() {
//           dropdownValue = value;
//         }),
//         iconStyleData: const IconStyleData(
//           icon: Icon(Icons.keyboard_arrow_down_rounded),
//           iconSize: 24,
//           iconEnabledColor: ColorConstants.kLightOrangeColor,
//         ),
//         buttonStyleData: ButtonStyleData(
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//             border: Border.all(
//               color: ColorConstants.kWhite,
//               width: 1,
//             ),
//             color: ColorConstants.kDarkPurpleColor,
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           elevation: 2,
//           // height: 40,
//         ),
//         dropdownStyleData: const DropdownStyleData(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               color: ColorConstants.kDarkPurpleColor),
//           maxHeight: 200,
//           offset: Offset(0, -5),
//         ),
//         dropdownSearchData: DropdownSearchData(
//           searchController: textEditingController,
//           searchInnerWidgetHeight: 50,
//           searchInnerWidget: Container(
//             height: 60,
//             padding: const EdgeInsets.only(
//               top: 8,
//               bottom: 4,
//               right: 8,
//               left: 8,
//             ),
//             child: TextFormField(
//               expands: true,
//               maxLines: null,
//               controller: textEditingController,
//               style: const TextStyle(color: ColorConstants.kWhite),
//               decoration: InputDecoration(
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: ColorConstants.kLightPurpleColor,
//                   ),
//                 ),
//                 focusedBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: ColorConstants.kWhite,
//                   ),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 8,
//                 ),
//                 hintText: 'Search for an item...',
//                 hintStyle: const TextStyle(color: ColorConstants.kWhite),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         //This to clear the search value when you close the menu
//         onMenuStateChange: (isOpen) {
//           if (!isOpen) {
//             textEditingController.clear();
//           }
//         },
//       ),
//     );
//     // return DropdownButton<String>(
//     //     items: provinceName.map<DropdownMenuItem<String>>((String e) {
//     //       return DropdownMenuItem<String>(
//     //         value: e,
//     //         child: Text(e)
//     //         );
//     //     }).toList(),
//     //     value: dropdownValue,
//     //     onChanged:( (String? e) => {
//     //       setState(() => dropdownValue = e!)
//     //     }),
//     //     dropdownColor: ColorConstants.kLightPurpleColor,

//     //     );
//   }
// }
