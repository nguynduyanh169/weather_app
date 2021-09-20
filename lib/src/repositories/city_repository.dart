import 'package:weather_app/src/networks/city_network.dart';

class CityRepository {
  final CityNetwork _cityNetwork = CityNetwork();

  Future<dynamic> getCityByName(
      {required String name, required int limit, required int offset}) {
    return _cityNetwork.getCityByName(name: name, limit: limit, offset: offset);
  }
}
