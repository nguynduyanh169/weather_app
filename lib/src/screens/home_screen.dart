import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/configs/size_config.dart';
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
                child: TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      print('edit');
                    },
                    child: const Text(
                      "Edit",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
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
                    print('ok');
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
              itemExtent: SizeConfig.blockSizeVertical! * 7,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if(index.isOdd){
                    return const Material(child: Divider(color: Colors.grey,),);
                  }
                  return Material(
                      child: ListTile(
                    selectedTileColor: Colors.grey,
                    onTap: () => Navigator.pushNamed(
                        context, RouteName.WEATHER_DETAILS_SCREEN),
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

  void openAddCity() async{
    
  }
}
