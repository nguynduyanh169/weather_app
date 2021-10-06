import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app/src/models/city_show.dart';
import 'package:weather_app/src/models/hive_object.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/repositories/weather_repository.dart';
import 'package:weather_app/src/utils/hive_utils.dart';

class HomeController extends GetxController {
  RxList<CityShow> results = <CityShow>[].obs;
  RxString message = "".obs;
  Rx<HomeStatus> homeStatus = HomeStatus.init.obs;

  final HiveUtils _hiveUtils = HiveUtils();
  final WeatherRepository _weatherRepository = WeatherRepository();

  @override
  void onReady() {
    fetchDataToHome();
    super.onReady();
  }

  void refreshFetchData() {
    results.clear();
    message.value = "";
  }

  void deleteCity(int id, int index) {
    bool check = _hiveUtils.deleteCity(id: id);
    if(check == true){
      results.removeAt(index);
      homeStatus.value = HomeStatus.deleteSuccess;
    }else{
      homeStatus.value = HomeStatus.deleteError;
    }
  }

  Future<void> fetchDataToHome() async {
    homeStatus.value = HomeStatus.loading;
    try {
      List<CityLocal> listCity = _hiveUtils.getAllCity();
      for (CityLocal city in listCity) {
        WeatherModel weather = await _weatherRepository.getWeatherByLocation(
            lat: city.latitude!, lon: city.longitude!);
        CityShow cityShow = CityShow(cityLocal: city, weatherModel: weather);
        results.add(cityShow);
      }
      if (results.isNotEmpty) {
        homeStatus.value = HomeStatus.loadSuccess;
      } else {
        message.value = "Empty";
        homeStatus.value = HomeStatus.loadError;
      }
    } on Exception catch (e) {
      message.value = e.toString();
      homeStatus.value = HomeStatus.loadError;
    }
  }
}

enum HomeStatus {
  loading,
  loadSuccess,
  loadError,
  init,
  deleteSuccess,
  deleteError
}

extension Explaination on HomeStatus {
  bool get isInit => this == HomeStatus.init;

  bool get isLoading => this == HomeStatus.loading;

  bool get isLoadSuccess => this == HomeStatus.loadSuccess;

  bool get isLoadError => this == HomeStatus.loadError;

  bool get isDeleteSuccess => this == HomeStatus.deleteSuccess;

  bool get isDeleteError => this == HomeStatus.deleteError;
}
