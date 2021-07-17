// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FishEntityAdapter extends TypeAdapter<FishEntity> {
  @override
  final int typeId = 0;

  @override
  FishEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FishEntity(
      id: fields[0] as int,
      fileName: fields[1] as String,
      name: fields[2] as NameEntity,
      availability: fields[3] as AvailabilityEntity,
      shadow: fields[4] as String,
      price: fields[5] as int,
      catchPhrase: fields[6] as String,
      museumPhrase: fields[7] as String,
      imageUri: fields[8] as String,
      iconUri: fields[9] as String,
      isCaught: fields[10] as bool,
      isDonated: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FishEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fileName)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.availability)
      ..writeByte(4)
      ..write(obj.shadow)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.catchPhrase)
      ..writeByte(7)
      ..write(obj.museumPhrase)
      ..writeByte(8)
      ..write(obj.imageUri)
      ..writeByte(9)
      ..write(obj.iconUri)
      ..writeByte(10)
      ..write(obj.isCaught)
      ..writeByte(11)
      ..write(obj.isDonated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FishEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
