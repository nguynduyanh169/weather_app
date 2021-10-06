import 'package:weather_app/src/models/hive_object.dart';
import 'package:weather_app/src/models/weather_model.dart';

class CityShow {
  WeatherModel? weatherModel;
  CityLocal? cityLocal;

  CityShow({this.weatherModel, this.cityLocal});
}
