import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/configs/size_config.dart';
import 'package:weather_app/src/controllers/weather_details_controller.dart';
import 'package:weather_app/src/models/weather_details_model.dart';
import 'package:weather_app/src/utils/weather_utils.dart';
import 'package:weather_app/src/widgets/weather_week.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherDetailsScreen extends StatelessWidget {
  WeatherDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    WeatherDetailsController weatherDetailsController =
        Get.put(WeatherDetailsController());
    final args =
        ModalRoute.of(context)!.settings.arguments as WeatherDetailsScreenArgs;
    weatherDetailsController.fetchDataToDetails(args.lat, args.lon);
    return CupertinoPageScaffold(
        backgroundColor: AppColor.BACKGROUND,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              automaticallyImplyLeading: true,
              previousPageTitle: 'Home',
              largeTitle: Text(args.cityName),
            ),
            SliverToBoxAdapter(
                child: Padding(
              child: const Text(
                'Now',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
            )),
            SliverToBoxAdapter(
                child: Container(
              color: const Color.fromRGBO(250, 250, 250, 10),
              width: SizeConfig.blockSizeHorizontal! * 100,
              height: SizeConfig.blockSizeVertical! * 18,
              child: Stack(
                children: [
                  Obx(() {
                    if (weatherDetailsController.screenStatus.value ==
                        WeatherDetailsStatus.loadSuccess) {
                      return WeatherBg(
                        weatherType: WeatherUtils.getWeatherBgType(
                            weatherDetailsController
                                .model.value.current!.weather.first.icon),
                        width: SizeConfig.blockSizeHorizontal! * 100,
                        height: SizeConfig.blockSizeVertical! * 18,
                      );
                    } else {
                      return WeatherBg(
                        weatherType: WeatherType.sunny,
                        width: SizeConfig.blockSizeHorizontal! * 100,
                        height: SizeConfig.blockSizeVertical! * 18,
                      );
                    }
                  }),
                  Container(
                    color: Colors.black87.withOpacity(0.2),
                    padding:
                        EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(() {
                              if (weatherDetailsController.screenStatus.value ==
                                  WeatherDetailsStatus.loadSuccess) {
                                return Icon(
                                  WeatherUtils.getIconData(
                                      weatherDetailsController.model.value
                                          .current!.weather.first.icon),
                                  color: Colors.white,
                                  size: 30,
                                );
                              } else {
                                return const Icon(
                                  WeatherIcons.na,
                                  color: Colors.white,
                                  size: 30,
                                );
                              }
                            }),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 5,
                            ),
                            Obx(() {
                              if (weatherDetailsController.screenStatus.value ==
                                  WeatherDetailsStatus.loadSuccess) {
                                return Text(
                                  weatherDetailsController
                                          .model.value.current!.temp
                                          .toStringAsFixed(0) +
                                      '\u2103',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                );
                              } else {
                                return const Text(
                                  'N/A',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                );
                              }
                            }),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 2,
                        ),
                        Obx(() {
                          if (weatherDetailsController.screenStatus.value ==
                              WeatherDetailsStatus.loadSuccess) {
                            return Text(
                              weatherDetailsController
                                  .model.value.current!.weather.first.main,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return const Text(
                              'Sunny',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            SliverToBoxAdapter(
                child: Padding(
              child: const Text(
                'Hourly',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
            )),
            SliverToBoxAdapter(
              child: Container(
                color: const Color.fromRGBO(250, 250, 250, 10),
                width: SizeConfig.blockSizeHorizontal! * 100,
                height: SizeConfig.blockSizeVertical! * 15,
                child: Obx(() {
                  if (weatherDetailsController.screenStatus.value ==
                      WeatherDetailsStatus.loadSuccess) {
                    return _buildHoursList(
                        weatherDetailsController.model.value.hourly, context);
                  } else {
                    return const Center(
                      child: Icon(
                        WeatherIcons.na,
                        color: Colors.black,
                        size: 40,
                      ),
                    );
                  }
                }),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              child: const Text(
                'This week',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
            )),
            SliverFixedExtentList(
              itemExtent: SizeConfig.blockSizeVertical! * 8,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const Material(child: WeatherWeek());
                },
                childCount: 5,
              ),
            )
          ],
        ));
  }

  ListView _buildHoursList(List<Hourly>? hourly, BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal! * 2,
            right: SizeConfig.blockSizeHorizontal! * 2,
            top: SizeConfig.blockSizeVertical! * 1,
            bottom: SizeConfig.blockSizeVertical! * 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateTime.fromMillisecondsSinceEpoch(hourly![index].dt)
                .toString()),
            Icon(WeatherUtils.getIconData(hourly[index].weather.first.icon)),
            Text(
              hourly[index].temp.toStringAsFixed(0) + '\u2103',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            )
          ],
        ),
      ),
      itemCount: hourly!.length - 24,
      scrollDirection: Axis.horizontal,
    );
  }
}

class WeatherDetailsScreenArgs {
  final double lat;
  final double lon;
  final String cityName;

  WeatherDetailsScreenArgs(
      {required this.lat, required this.lon, required this.cityName});
}
