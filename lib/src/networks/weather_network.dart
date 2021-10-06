import 'package:dio/dio.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/models/weather_details_model.dart';
import 'package:weather_app/src/models/weather_model.dart';

class WeatherNetwork {
  final Dio _dio = Dio();

  Future<dynamic> getWeatherDetails(
      {required double lat, required double lon}) async {
    WeatherDetailsModel? weatherDetalsModel;
    try {
      Map<String, dynamic> params = {
        "appid": ApiKey.OPEN_WEATHER_KEY,
        "lat": lat,
        "lon": lon,
        "units": "metric"
      };
      Response response = await _dio.get(ApiUrl.GET_WEATHER_DETAILS,
          queryParameters: params);
      if (response.statusCode == 200) {
        weatherDetalsModel = WeatherDetailsModel.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
    return weatherDetalsModel;
  }

  Future<dynamic> getWeatherByLocation(
      {required double lat, required double lon}) async {
    WeatherModel? weatherModel;
    try {
      Map<String, dynamic> params = {
        "appid": ApiKey.OPEN_WEATHER_KEY,
        "lat": lat,
        "lon": lon,
        "units": "metric"
      };
      Response response = await _dio.get(ApiUrl.GET_WEATHER_BY_LOCATION,
          queryParameters: params);
      if (response.statusCode == 200) {
        weatherModel = WeatherModel.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
    return weatherModel;
  }
}
