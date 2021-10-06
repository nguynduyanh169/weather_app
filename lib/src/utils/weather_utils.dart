import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherUtils {
  static IconData getIconData(String iconCode) {
    switch (iconCode) {
      case '01d':
        return WeatherIcons.day_sunny;
      case '01n':
        return WeatherIcons.night_clear;
      case '02d':
        return WeatherIcons.day_sunny_overcast;
      case '02n':
        return WeatherIcons.night_partly_cloudy;
      case '03d':
        return WeatherIcons.day_cloudy;
      case '04d':
        return WeatherIcons.day_cloudy_high;
      case '03n':
        return WeatherIcons.night_cloudy;
      case '04n':
        return WeatherIcons.night_cloudy_high;
      case '09d':
        return WeatherIcons.day_showers;
      case '09n':
        return WeatherIcons.night_showers;
      case '10d':
        return WeatherIcons.day_rain;
      case '10n':
        return WeatherIcons.night_rain;
      case '11d':
        return WeatherIcons.day_thunderstorm;
      case '11n':
        return WeatherIcons.night_thunderstorm;
      case '13d':
        return WeatherIcons.day_snow;
      case '13n':
        return WeatherIcons.night_snow;
      case '50d':
        return WeatherIcons.day_fog;
      case '50n':
        return WeatherIcons.night_fog;
      default:
        return WeatherIcons.day_sunny;
    }
  }

  static WeatherType getWeatherBgType(String iconCode) {
    switch (iconCode) {
      case '01d':
        return WeatherType.sunny;
      case '01n':
        return WeatherType.sunnyNight;
      case '02d':
        return WeatherType.overcast;
      case '02n':
        return WeatherType.hazy;
      case '03d':
        return WeatherType.cloudy;
      case '04d':
        return WeatherType.cloudy;
      case '03n':
        return WeatherType.cloudyNight;
      case '04n':
        return WeatherType.cloudyNight;
      case '09d':
        return WeatherType.lightRainy;
      case '09n':
        return WeatherType.lightRainy;
      case '10d':
        return WeatherType.heavyRainy;
      case '10n':
        return WeatherType.heavyRainy;
      case '11d':
        return WeatherType.thunder;
      case '11n':
        return WeatherType.thunder;
      case '13d':
        return WeatherType.middleSnow;
      case '13n':
        return WeatherType.middleSnow;
      case '50d':
        return WeatherType.foggy;
      case '50n':
        return WeatherType.foggy;
      default:
        return WeatherType.sunny;
    }
  }
}
