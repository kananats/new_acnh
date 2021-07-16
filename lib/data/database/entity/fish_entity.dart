import 'package:flutter_template/data/api/response/fish_response.dart';
import 'package:flutter_template/data/database/entity/availability_entity.dart';
import 'package:flutter_template/data/database/entity/name_entity.dart';
import 'package:hive/hive.dart';

part 'fish_entity.g.dart';

@HiveType(typeId: 0)
class FishEntity extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String fileName;

  @HiveField(2)
  final NameEntity name;

  @HiveField(3)
  final AvailabilityEntity availability;

  @HiveField(4)
  final String shadow;

  @HiveField(5)
  final int price;

  @HiveField(6)
  final String catchPhrase;

  @HiveField(7)
  final String museumPhrase;

  @HiveField(8)
  final String imageUri;

  @HiveField(9)
  final String iconUri;

  FishEntity({
    required this.id,
    required this.fileName,
    required this.name,
    required this.availability,
    required this.shadow,
    required this.price,
    required this.catchPhrase,
    required this.museumPhrase,
    required this.imageUri,
    required this.iconUri,
  });

  factory FishEntity.fromResponse(FishResponse response) {
    return FishEntity(
      id: response.id,
      fileName: response.fileName,
      name: NameEntity.fromResponse(response.name),
      availability: AvailabilityEntity.fromResponse(response.availability),
      shadow: response.shadow,
      price: response.price,
      catchPhrase: response.catchPhrase,
      museumPhrase: response.museumPhrase,
      imageUri: response.imageUri,
      iconUri: response.iconUri,
    );
  }
}
