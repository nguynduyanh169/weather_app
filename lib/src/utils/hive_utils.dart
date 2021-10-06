import 'package:hive/hive.dart';
import 'package:weather_app/src/configs/constants.dart';
import 'package:weather_app/src/models/hive_object.dart';

class HiveUtils {
  bool addCity({required CityLocal city}) {
    final openBox = Hive.box(HiveBox.CITY_TABLE);
    bool checkExist = checkCityExist(id: city.id!);
    if (!checkExist) {
      openBox.put(city.id, city);
      return true;
    } else {
      return false;
    }
  }

  bool checkCityExist({required int id}) {
    final openBox = Hive.box(HiveBox.CITY_TABLE);
    // ignore: unnecessary_null_comparison
    return openBox.get(id) != null;
  }

  bool deleteCity({required int id}) {
    final openBox = Hive.box(HiveBox.CITY_TABLE);
    openBox.delete(id);
    if (checkCityExist(id: id)) {
      return false;
    } else {
      return true;
    }
  }

  CityLocal getCity({required int id}) {
    final openBox = Hive.box(HiveBox.CITY_TABLE);
    CityLocal city = openBox.get(id);
    return city;
  }

  List<CityLocal> getAllCity() {
    List<CityLocal>? listCity = [];
    final openBox = Hive.box(HiveBox.CITY_TABLE);
    for (CityLocal city in openBox.values) {
      listCity.add(city);
    }
    return listCity;
  }
}
