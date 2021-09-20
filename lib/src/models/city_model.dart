// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
     this.data,
     this.metadata,
  });

  List<Datum>? data;
  Metadata? metadata;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "metadata": metadata!.toJson(),
      };
}

class Datum {
  Datum({
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

  int? id;
  String? wikiDataId;
  String? type;
  String? city;
  String? name;
  String? country;
  String? countryCode;
  String? region;
  String? regionCode;
  double? latitude;
  double? longitude;
  int? population;

  factory Datum.fromJson(Map<String, dynamic>? json) => Datum(
        id: json!["id"],
        wikiDataId: json["wikiDataId"],
        type: json["type"],
        city: json["city"],
        name: json["name"],
        country: json["country"],
        countryCode: json["countryCode"],
        region: json["region"],
        regionCode: json["regionCode"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        population: json["population"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wikiDataId": wikiDataId,
        "type": type,
        "city": city,
        "name": name,
        "country": country,
        "countryCode": countryCode,
        "region": region,
        "regionCode": regionCode,
        "latitude": latitude,
        "longitude": longitude,
        "population": population,
      };
}

class Metadata {
  Metadata({
    this.currentOffset,
    this.totalCount,
  });

  int? currentOffset;
  int? totalCount;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentOffset: json["currentOffset"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "currentOffset": currentOffset,
        "totalCount": totalCount,
      };
}
