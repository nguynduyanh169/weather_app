import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app/src/models/weather_details_model.dart';
import 'package:weather_app/src/models/weather_details_show.dart';
import 'package:weather_app/src/repositories/weather_repository.dart';

class WeatherDetailsController extends GetxController {
  Rx<WeatherDetailsModel> model = WeatherDetailsModel().obs;
  Rx<WeatherDetailsShow> weatherDetails = WeatherDetailsShow().obs;
  RxString message = "".obs;
  Rx<WeatherDetailsStatus> screenStatus = WeatherDetailsStatus.init.obs;

  final WeatherRepository _weatherRepository = WeatherRepository();
  @override
  void onReady() {
    //fetchDataToDetails();
    super.onReady();
  }

  Future<void> fetchDataToDetails(double lat, double lon) async {
    screenStatus.value = WeatherDetailsStatus.loading;
    try {
      model.value =
          await _weatherRepository.getWeatherDetails(lat: lat, lon: lon);
      print(model.value.daily!.length);
      screenStatus.value = WeatherDetailsStatus.loadSuccess;
    } on Exception catch (e) {
      message.value = e.toString();
      screenStatus.value = WeatherDetailsStatus.loadError;
    }
  }
}

enum WeatherDetailsStatus {
  loading,
  loadSuccess,
  loadError,
  init,
}

extension Explaination on WeatherDetailsStatus {
  bool get isInit => this == WeatherDetailsStatus.init;

  bool get isLoading => this == WeatherDetailsStatus.loading;

  bool get isLoadSuccess => this == WeatherDetailsStatus.loadSuccess;

  bool get isLoadError => this == WeatherDetailsStatus.loadError;
}
