

import 'package:flutter/material.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/screens/add_city_screen.dart';
import 'package:weather_app/src/screens/home_screen.dart';
import 'package:weather_app/src/screens/weather_details_screen.dart';

final routes = {
  RouteName.HOME_SCREEN: (BuildContext context) => const HomeScreen(),
  RouteName.ADD_CITY_SCREEN: (BuildContext context) => const AddCityScreen(),
  RouteName.WEATHER_DETAILS_SCREEN: (BuildContext context) => const WeatherDetailsScreen(),
};
