import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/src/configs/size_config.dart';
import 'package:weather_app/src/controllers/add_city_controller.dart';

// ignore: must_be_immutable
class AddCityScreen extends StatelessWidget {
  AddCityScreen({Key? key}) : super(key: key);
  AddCityController cityController = Get.put(AddCityController());
  final ScrollController _scrollController = ScrollController();
  String? cityName;

  void setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        cityController.fetchMoreCity(cityName!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CupertinoPageScaffold(
        child: CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          leading: Material(
            color: Colors.transparent,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 1.5),
                  child: const Text(
                    "Cancel",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                )),
          ),
          largeTitle: const Text('Add City'),
        ),
        SliverToBoxAdapter(
            child: Container(
          color: Colors.white,
          child: CupertinoSearchTextField(
            onChanged: (String value) {
              print('The text has changed to: $value');
            },
            onSubmitted: (String value) {
              cityName = value;
              cityController.findCityByName(cityName!);
            },
          ),
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
        )),
        GetX<AddCityController>(builder: (controller) {
          setupScrollController();
          
          if (controller.addCityStatus.value == AddCityStatus.searching &&
              controller.isFirstLoad.value) {
            return const SliverFillRemaining(
              child: SizedBox(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            );
          } else {
            return SliverFixedExtentList(
                itemExtent: SizeConfig.blockSizeVertical! * 9,
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (index < cityController.listCity.length) {
                    return Material(
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal! * 100,
                        height: SizeConfig.blockSizeVertical! * 10,
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () => print('ok'),
                              leading:
                                  const Icon(CupertinoIcons.building_2_fill),
                              title: Text(
                                cityController.listCity[index].name!,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              subtitle: Text(
                                cityController.listCity[index].country!,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              trailing: const Icon(
                                CupertinoIcons.add_circled,
                                color: Colors.blueAccent,
                              ),
                            ),
                            const Divider(
                              height: 0.5,
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    Timer(const Duration(milliseconds: 10), () {
                      _scrollController
                          .jumpTo(_scrollController.position.maxScrollExtent);
                    });
                    return const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(child: CupertinoActivityIndicator()),
                    );
                  }
                },
                    childCount: cityController.listCity.length +
                        ((cityController.addCityStatus.value ==
                                AddCityStatus.searching)
                            ? 1
                            : 0)));
          }
        })
      ],
    ));
  }
}
