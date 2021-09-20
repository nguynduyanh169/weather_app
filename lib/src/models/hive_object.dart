import 'package:hive/hive.dart';
part 'hive_object.g.dart';

@HiveType(typeId: 0)
class CityLocal extends HiveObject {
  @HiveField(0)
  late final int? id;

  @HiveField(1)
  late final String? wikiDataId;

  @HiveField(2)
  late final String? type;

  @HiveField(3)
  late final String? city;

  @HiveField(4)
  late final String? name;

  @HiveField(5)
  late final String? country;

  @HiveField(6)
  late final String? countryCode;

  @HiveField(7)
  late final String? region;

  @HiveField(8)
  late final String? regionCode;

  @HiveField(9)
  late final double? latitude;

  @HiveField(10)
  late final double? longitude;

  @HiveField(11)
  late final int? population;

  CityLocal({
    this.id,
    this.wikiDataId,
    this.type,
    this.city,
    this.name,
    this.country,
    this.countryCode,
    this.region,
    this.regionCode,
    this.latitude,
    this.longitude,
    this.population,
  });
}
