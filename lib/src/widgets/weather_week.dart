import 'package:flutter/material.dart';
import 'package:weather_app/src/configs/size_config.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherWeek extends StatelessWidget {
  const WeatherWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal! * 3,
          right: SizeConfig.blockSizeHorizontal! * 3,
          top: SizeConfig.blockSizeVertical! * 1,
          bottom: SizeConfig.blockSizeVertical! * 1),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          const Text('Sunday', style: TextStyle(fontSize: 16),),
          const Icon(WeatherIcons.day_rain),
          Row(
            children:  [
              const Text('30', style: TextStyle(fontSize: 16),),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 3,),
              const Text('24', style: TextStyle(fontSize: 16, color: Colors.grey),)
            ],
          )
        ],
      ),
    );
  }
}
