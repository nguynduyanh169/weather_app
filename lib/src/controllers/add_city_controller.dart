import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app/src/models/city_model.dart';
import 'package:weather_app/src/models/hive_object.dart';
import 'package:weather_app/src/repositories/city_repository.dart';
import 'package:weather_app/src/utils/hive_utils.dart';

class AddCityController extends GetxController {
  RxList<Datum> listCity = <Datum>[].obs;
  RxString message = "".obs;
  Rx<AddCityStatus> addCityStatus = AddCityStatus.init.obs;
  int limit = 10;
  int currentOffset = 0;
  int total = 0;
  RxBool isFirstLoad = true.obs;

  final CityRepository _cityRepository = CityRepository();

  final HiveUtils _hiveUtils = HiveUtils();

  Future<void> findCityByName(String cityName) async {
    addCityStatus.value = AddCityStatus.searching;
    try {
      CityModel cityModel = await _cityRepository
          .getCityByName(name: cityName, limit: limit, offset: currentOffset)
          .whenComplete(
              () => addCityStatus.value = AddCityStatus.searchSuccess);
      listCity.value = cityModel.data!;
      total = cityModel.metadata!.totalCount!;
      currentOffset = cityModel.metadata!.currentOffset!;
      isFirstLoad.value = false;
    } on Exception catch (e) {
      message.value = e.toString();
      addCityStatus.value = AddCityStatus.searchError;
    }
  }

  Future<void> fetchMoreCity(String cityName) async {
    if (addCityStatus.value != AddCityStatus.searching) {
      currentOffset = currentOffset + limit;
      addCityStatus.value = AddCityStatus.searching;
      try {
        CityModel cityModel = await _cityRepository
            .getCityByName(name: cityName, limit: limit, offset: currentOffset)
            .whenComplete(
                () => addCityStatus.value = AddCityStatus.searchSuccess);
        listCity.addAll(cityModel.data!);
        currentOffset = cityModel.metadata!.currentOffset!;
      } on Exception catch (e) {
        message.value = e.toString();
        addCityStatus.value = AddCityStatus.searchError;
      }
    }
  }

  Future<void> showErrorDialog(
      String errorMessage, BuildContext context) async {
     await showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text("Error"),
              content: Text(errorMessage),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Dismiss'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }

  void saveCityToLocal(Datum city) {
    addCityStatus.value = AddCityStatus.saving;
    try {
      CityLocal cityLocal = CityLocal(
          id: city.id,
          name: city.name,
          city: city.city,
          wikiDataId: city.wikiDataId,
          type: city.type,
          country: city.country,
          countryCode: city.countryCode,
          region: city.region,
          regionCode: city.regionCode,
          latitude: city.latitude,
          longitude: city.longitude,
          population: city.population);
      bool isSaved = _hiveUtils.addCity(city: cityLocal);
      if (isSaved == true) {
        addCityStatus.value = AddCityStatus.saveSuccess;
      } else {
        message.value = "City has been exist";
        addCityStatus.value = AddCityStatus.saveError;
      }
    } on Exception catch (e) {
      message.value = e.toString();
      addCityStatus.value = AddCityStatus.saveError;
    }
  }
}

enum AddCityStatus {
  searching,
  searchSuccess,
  searchError,
  init,
  saving,
  saveSuccess,
  saveError
}

extension Explaination on AddCityStatus {
  bool get isInit => this == AddCityStatus.init;

  bool get isSearching => this == AddCityStatus.searching;

  bool get isSearchSuccess => this == AddCityStatus.searchSuccess;

  bool get isSearchError => this == AddCityStatus.searchError;

  bool get isSaving => this == AddCityStatus.saving;

  bool get isSaveSuccess => this == AddCityStatus.saveSuccess;

  bool get isSaveError => this == AddCityStatus.saveError;
}
