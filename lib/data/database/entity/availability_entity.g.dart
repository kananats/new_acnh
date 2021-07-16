// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AvailabilityEntityAdapter extends TypeAdapter<AvailabilityEntity> {
  @override
  final int typeId = 2;

  @override
  AvailabilityEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvailabilityEntity(
      monthNorthern: fields[0] as String,
      monthSouthern: fields[1] as String,
      location: fields[2] as String,
      rarity: fields[3] as String,
      monthArrayNorthern: (fields[4] as List).cast<int>(),
      monthArraySouthern: (fields[5] as List).cast<int>(),
      timeArray: (fields[6] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, AvailabilityEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.monthNorthern)
      ..writeByte(1)
      ..write(obj.monthSouthern)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.rarity)
      ..writeByte(4)
      ..write(obj.monthArrayNorthern)
      ..writeByte(5)
      ..write(obj.monthArraySouthern)
      ..writeByte(6)
      ..write(obj.timeArray);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailabilityEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
