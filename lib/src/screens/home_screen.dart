import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/configs/size_config.dart';
import 'package:weather_app/src/screens/add_city_screen.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    openAddCity();
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              child: const Text(
                'Your Cities',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
            )),
            SliverFixedExtentList(
              itemExtent: SizeConfig.blockSizeVertical! * 10,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Material(
                      child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.grey, width: 0.2))),
                    child: Stack(
                      children: [
                        WeatherBg(
                          weatherType: WeatherType.sunny,
                          width: SizeConfig.blockSizeHorizontal! * 100,
                          height: SizeConfig.blockSizeVertical! * 10,
                        ),
                        Container(
                          width: SizeConfig.blockSizeHorizontal! * 100,
                          height: SizeConfig.blockSizeVertical! * 10,
                          color: Colors.black87.withOpacity(0.2),
                          child: ListTile(
                            onTap: () => Navigator.pushNamed(
                                context, RouteName.WEATHER_DETAILS_SCREEN),
                            leading: const Text(
                              "Bien Hoa",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            trailing: SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 35,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    WeatherIcons.day_sunny_overcast,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  Text(
                                    '25' '\u2103',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
                },
                childCount: 10,
              ),
            )
          ],
        ));
  }

  void openAddCity() async {
    await showCupertinoModalBottomSheet(
        context: context, builder: (context) => AddCityScreen());
  }
}
