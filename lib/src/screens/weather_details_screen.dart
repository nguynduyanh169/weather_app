import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/configs/size_config.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CupertinoPageScaffold(
        backgroundColor: AppColor.BACKGROUND,
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              automaticallyImplyLeading: true,
              previousPageTitle: 'Home',
              largeTitle: const Text('Bien Hoa'),
              trailing: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: const Icon(
                    CupertinoIcons.add_circled_solid,
                    size: 25,
                  ),
                  onTap: () {
                    print('ok');
                  },
                ),
              ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    WeatherIcons.day_sunny_overcast,
                    size: 30,
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 5,
                  ),
                  const Text(
                    '25' '\u2103',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal! * 2,
                          right: SizeConfig.blockSizeHorizontal! * 2,
                          top: SizeConfig.blockSizeVertical! * 1,
                          bottom: SizeConfig.blockSizeVertical! * 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('12:00'),
                          Icon(WeatherIcons.cloudy),
                          Text(
                            '25' '\u2103',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal! * 2,
                          right: SizeConfig.blockSizeHorizontal! * 2,
                          top: SizeConfig.blockSizeVertical! * 1,
                          bottom: SizeConfig.blockSizeVertical! * 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('12:00'),
                          Icon(WeatherIcons.cloudy),
                          Text(
                            '25' '\u2103',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal! * 2,
                          right: SizeConfig.blockSizeHorizontal! * 2,
                          top: SizeConfig.blockSizeVertical! * 1,
                          bottom: SizeConfig.blockSizeVertical! * 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('12:00'),
                          Icon(WeatherIcons.cloudy),
                          Text(
                            '25' '\u2103',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal! * 2,
                          right: SizeConfig.blockSizeHorizontal! * 2,
                          top: SizeConfig.blockSizeVertical! * 1,
                          bottom: SizeConfig.blockSizeVertical! * 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('12:00'),
                          Icon(WeatherIcons.cloudy),
                          Text(
                            '25' '\u2103',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal! * 2,
                          right: SizeConfig.blockSizeHorizontal! * 2,
                          top: SizeConfig.blockSizeVertical! * 1,
                          bottom: SizeConfig.blockSizeVertical! * 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('12:00'),
                          Icon(WeatherIcons.cloudy),
                          Text(
                            '25' '\u2103',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                    )
                    ,
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal! * 2,
                          right: SizeConfig.blockSizeHorizontal! * 2,
                          top: SizeConfig.blockSizeVertical! * 1,
                          bottom: SizeConfig.blockSizeVertical! * 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('12:00'),
                          Icon(WeatherIcons.cloudy),
                          Text(
                            '25' '\u2103',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal! * 2,
                          right: SizeConfig.blockSizeHorizontal! * 2,
                          top: SizeConfig.blockSizeVertical! * 1,
                          bottom: SizeConfig.blockSizeVertical! * 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('12:00'),
                          Icon(WeatherIcons.day_sunny),
                          Text(
                            '25' '\u2103',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal! * 2,
                          right: SizeConfig.blockSizeHorizontal! * 2,
                          top: SizeConfig.blockSizeVertical! * 1,
                          bottom: SizeConfig.blockSizeVertical! * 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('12:00'),
                          Icon(WeatherIcons.cloudy),
                          Text(
                            '25' '\u2103',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
              itemExtent: SizeConfig.blockSizeVertical! * 7,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index.isOdd) {
                    return const Material(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    );
                  }
                  return Material(
                      child: ListTile(
                    selectedTileColor: Colors.grey,
                    onTap: () => print('ok'),
                    leading: const Text(
                      "Bien Hoa",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    trailing: SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            WeatherIcons.day_sunny_overcast,
                            size: 22,
                          ),
                          Text(
                            '25' '\u2103',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(CupertinoIcons.forward)
                        ],
                      ),
                    ),
                  ));
                },
                childCount: 20,
              ),
            )
          ],
        ));
  }
}
