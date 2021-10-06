import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/configs/size_config.dart';
import 'package:weather_app/src/controllers/home_controller.dart';
import 'package:weather_app/src/screens/add_city_screen.dart';
import 'package:weather_app/src/screens/weather_details_screen.dart';
import 'package:weather_app/src/utils/weather_utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CupertinoPageScaffold(
        backgroundColor: AppColor.BACKGROUND,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              leading: Material(
                color: Colors.transparent,
                child: GestureDetector(
                    onTap: () {
                      print('edit');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical! * 1.5),
                      child: const Text(
                        "Edit",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.blue),
                      ),
                    )),
              ),
              largeTitle: const Text('Weather'),
              trailing: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: const Icon(
                    CupertinoIcons.add_circled_solid,
                    size: 25,
                  ),
                  onTap: () {
                    openAddCity(context);
                  },
                ),
              ),
            ),
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                homeController.refreshFetchData();
                homeController.fetchDataToHome();
              },
            ),
            SliverToBoxAdapter(
                child: Padding(
              child: const Text(
                'Your Cities',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
            )),
            GetBuilder<HomeController>(builder: (controller) {
              return Obx(() {
                if (controller.homeStatus.value == HomeStatus.loading) {
                  return loading();
                } else {
                  return cityList(controller);
                }
              });
            })
          ],
        ));
  }

  SliverFixedExtentList cityList(HomeController controller) {
    return SliverFixedExtentList(
      itemExtent: SizeConfig.blockSizeVertical! * 10,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Material(
              child: Container(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
            child: Stack(
              children: [
                WeatherBg(
                  weatherType: WeatherUtils.getWeatherBgType(controller
                      .results[index].weatherModel!.weather.first.icon),
                  width: SizeConfig.blockSizeHorizontal! * 100,
                  height: SizeConfig.blockSizeVertical! * 10,
                ),
                Dismissible(
                  onDismissed: (direction) {
                    homeController.deleteCity(
                        controller.results[index].cityLocal!.id!, index);
                  },
                  background: Container(
                    color: Colors.redAccent,
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 2,
                        right: SizeConfig.blockSizeHorizontal! * 2),
                    child: Row(
                      children: const [
                        Icon(
                          CupertinoIcons.delete,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  key: Key(controller.results[index].cityLocal!.id!.toString()),
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal! * 100,
                    height: SizeConfig.blockSizeVertical! * 10,
                    color: Colors.black87.withOpacity(0.2),
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, RouteName.WEATHER_DETAILS_SCREEN,
                          arguments: WeatherDetailsScreenArgs(
                              lat: controller
                                  .results[index].weatherModel!.coord.lat,
                              lon: controller
                                  .results[index].weatherModel!.coord.lon,
                              cityName:
                                  controller.results[index].cityLocal!.name!)),
                      leading: Text(
                        controller.results[index].cityLocal!.name!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      trailing: SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image(
                            //     image: NetworkImage(
                            //         "http://openweathermap.org/img/w/01d.png")),
                            Icon(
                              WeatherUtils.getIconData(controller.results[index]
                                  .weatherModel!.weather.first.icon),
                              size: 25,
                              color: Colors.white,
                            ),
                            Text(
                              controller.results[index].weatherModel!.main.temp
                                      .toStringAsFixed(0) +
                                  '\u2103',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
        childCount: controller.results.length,
      ),
    );
  }

  SliverFillRemaining loading() {
    return const SliverFillRemaining(
      child: SizedBox(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  void openAddCity(BuildContext context) async {
    await showCupertinoModalBottomSheet(
        context: context,
        builder: (context) => AddCityScreen()).whenComplete(() {
      homeController.refreshFetchData();
      homeController.fetchDataToHome();
    });
  }
}
