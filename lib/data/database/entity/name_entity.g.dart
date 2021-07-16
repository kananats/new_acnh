// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NameEntityAdapter extends TypeAdapter<NameEntity> {
  @override
  final int typeId = 1;

  @override
  NameEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NameEntity(
      USen: fields[0] as String,
      EUen: fields[1] as String,
      EUde: fields[2] as String,
      EUes: fields[3] as String,
      USes: fields[4] as String,
      EUfr: fields[5] as String,
      USfr: fields[6] as String,
      EUit: fields[7] as String,
      EUnl: fields[8] as String,
      CNzh: fields[9] as String,
      TWzh: fields[10] as String,
      JPja: fields[11] as String,
      KRko: fields[12] as String,
      EUru: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NameEntity obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.USen)
      ..writeByte(1)
      ..write(obj.EUen)
      ..writeByte(2)
      ..write(obj.EUde)
      ..writeByte(3)
      ..write(obj.EUes)
      ..writeByte(4)
      ..write(obj.USes)
      ..writeByte(5)
      ..write(obj.EUfr)
      ..writeByte(6)
      ..write(obj.USfr)
      ..writeByte(7)
      ..write(obj.EUit)
      ..writeByte(8)
      ..write(obj.EUnl)
      ..writeByte(9)
      ..write(obj.CNzh)
      ..writeByte(10)
      ..write(obj.TWzh)
      ..writeByte(11)
      ..write(obj.JPja)
      ..writeByte(12)
      ..write(obj.KRko)
      ..writeByte(13)
      ..write(obj.EUru);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
