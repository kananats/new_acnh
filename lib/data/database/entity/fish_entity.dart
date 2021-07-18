import 'package:new_acnh/data/api/response/fish_response.dart';
import 'package:new_acnh/data/database/entity/availability_entity.dart';
import 'package:new_acnh/data/database/entity/name_entity.dart';
import 'package:new_acnh/model/fish.dart';
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

  @HiveField(10)
  final bool isCaught;

  @HiveField(11)
  final bool isDonated;

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
    required this.isCaught,
    required this.isDonated,
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
      isCaught: false,
      isDonated: false,
    );
  }

  factory FishEntity.fromModel(Fish model) {
    return FishEntity(
      id: model.id,
      fileName: model.fileName,
      name: NameEntity.fromModel(model.name),
      availability: AvailabilityEntity.fromModel(model.availability),
      shadow: model.shadow,
      price: model.price,
      catchPhrase: model.catchPhrase,
      museumPhrase: model.museumPhrase,
      imageUri: model.imageUri,
      iconUri: model.iconUri,
      isCaught: model.isCaught,
      isDonated: model.isDonated,
    );
  }
}
