import 'package:flutter/material.dart';

class RouteName {
  static const HOME_SCREEN = "/";
  static const ADD_CITY_SCREEN = "/addCity";
  static const WEATHER_DETAILS_SCREEN = "/weatherDetails";
}

class AppColor {
  static const Color BACKGROUND = Color.fromRGBO(229, 229, 229, 10);
}

class ApiUrl {
  static const CITY_BASE_URL = "https://wft-geo-db.p.rapidapi.com";
  static const WEATHER_BASE_URL = "https://api.openweathermap.org";
  static const GET_CITY_BY_NAME = CITY_BASE_URL + "/v1/geo/cities";
  static const GET_WEATHER_BY_LOCATION = WEATHER_BASE_URL + "/data/2.5/weather";
  static const GET_WEATHER_DETAILS = WEATHER_BASE_URL + "/data/2.5/onecall";
}

class ApiKey {
  static const RAPID_API_KEY =
      "523c6b3c0bmsh2d64112741d8701p144510jsnb5743b6397c2";
  static const RAPID_API_HOST = "wft-geo-db.p.rapidapi.com";
  static const OPEN_WEATHER_KEY = "4147f7c4c99ce70fca72d274e00295c1";
}

class HiveBox {
  static const CITY_TABLE = "City";
}
