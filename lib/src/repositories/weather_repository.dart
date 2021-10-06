import 'package:weather_app/src/networks/weather_network.dart';

class WeatherRepository {
  final WeatherNetwork _weatherNetwork = WeatherNetwork();

  Future<dynamic> getWeatherByLocation(
      {required double lat, required double lon}) {
    return _weatherNetwork.getWeatherByLocation(lat: lat, lon: lon);
  }

  Future<dynamic> getWeatherDetails(
      {required double lat, required double lon}) {
    return _weatherNetwork.getWeatherDetails(lat: lat, lon: lon);
  }
}
