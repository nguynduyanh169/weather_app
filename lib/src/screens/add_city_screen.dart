import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/src/configs/size_config.dart';
import 'package:weather_app/src/controllers/add_city_controller.dart';
import 'package:weather_app/src/controllers/home_controller.dart';

// ignore: must_be_immutable
class AddCityScreen extends StatelessWidget {
  AddCityScreen({Key? key}) : super(key: key);
  AddCityController cityController = Get.put(AddCityController());
  HomeController homeController = Get.find();
  final ScrollController _scrollController = ScrollController();
  String? cityName;
  final _messangeKey = GlobalKey<ScaffoldMessengerState>();

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
        Obx(() {
          setupScrollController();
          if (cityController.addCityStatus.value == AddCityStatus.searching &&
              cityController.isFirstLoad.value) {
            return _buildLoading();
          } else {
            if (cityController.addCityStatus.value == AddCityStatus.saveError) {
              //cityController.showErrorDialog(controller.message.value, context);
              _messangeKey.currentState!.showSnackBar(
                  SnackBar(content: Text(cityController.message.value)));
              // ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(content: Text(cityController.message.value)));
            }
            if (cityController.addCityStatus.value ==
                AddCityStatus.saveSuccess) {
              Navigator.pop(context);
              Get.reset();
            }
            return _buildListCity(cityController);
          }
        })
      ],
    ));
  }

  SliverFixedExtentList _buildListCity(AddCityController controller) {
    return SliverFixedExtentList(
        itemExtent: SizeConfig.blockSizeVertical! * 12,
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          if (index < cityController.listCity.length) {
            return Material(
              child: Container(
                width: SizeConfig.blockSizeHorizontal! * 100,
                height: SizeConfig.blockSizeVertical! * 10,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => controller
                          .saveCityToLocal(cityController.listCity[index]),
                      leading: const Icon(CupertinoIcons.building_2_fill),
                      title: Text(
                        cityController.listCity[index].name!,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      subtitle: Text(
                        cityController.listCity[index].country!,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      trailing:
                          controller.addCityStatus.value == AddCityStatus.saving
                              ? const CupertinoActivityIndicator()
                              : const Icon(
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
                ((cityController.addCityStatus.value == AddCityStatus.searching)
                    ? 1
                    : 0)));
  }

  SliverFillRemaining _buildLoading() {
    return const SliverFillRemaining(
      child: SizedBox(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
