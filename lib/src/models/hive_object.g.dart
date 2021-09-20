// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityLocalAdapter extends TypeAdapter<CityLocal> {
  @override
  final int typeId = 0;

  @override
  CityLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityLocal(
      id: fields[0] as int?,
      wikiDataId: fields[1] as String?,
      type: fields[2] as String?,
      city: fields[3] as String?,
      name: fields[4] as String?,
      country: fields[5] as String?,
      countryCode: fields[6] as String?,
      region: fields[7] as String?,
      regionCode: fields[8] as String?,
      latitude: fields[9] as double?,
      longitude: fields[10] as double?,
      population: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CityLocal obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.wikiDataId)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.country)
      ..writeByte(6)
      ..write(obj.countryCode)
      ..writeByte(7)
      ..write(obj.region)
      ..writeByte(8)
      ..write(obj.regionCode)
      ..writeByte(9)
      ..write(obj.latitude)
      ..writeByte(10)
      ..write(obj.longitude)
      ..writeByte(11)
      ..write(obj.population);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
