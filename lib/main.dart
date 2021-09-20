import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/models/hive_object.dart';
import 'package:weather_app/src/route.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  final appDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  Hive.registerAdapter<CityLocal>(CityLocalAdapter());
  await Hive.openBox(HiveBox.CITY_TABLE);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather App',
      theme: const CupertinoThemeData(brightness: Brightness.light),
      routes: routes,
    );
  }
}
