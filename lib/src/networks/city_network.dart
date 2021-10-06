import 'package:dio/dio.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/models/city_model.dart';

class CityNetwork {
  final Dio _dio = Dio();

  Future<dynamic> getCityByName(
      {required String name, required int limit, required int offset}) async {
    CityModel? cityModel;
    try {
      Map<String, dynamic> headers = {
        "x-rapidapi-host": ApiKey.RAPID_API_HOST,
        "x-rapidapi-key": ApiKey.RAPID_API_KEY
      };

      Map<String, dynamic> params = {
        "limit": limit,
        "offset": offset,
        "namePrefix": name
      };
      Response response = await _dio.get(ApiUrl.GET_CITY_BY_NAME,
          options: Options(headers: headers), queryParameters: params);
      if (response.statusCode == 200) {
        cityModel = CityModel.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
    return cityModel;
  }
}
