import 'package:flutter_template/data/database/entity/fish_entity.dart';
import 'package:flutter_template/model/availability.dart';
import 'package:flutter_template/model/name.dart';

class Fish {
  final int id;

  final String fileName;

  final Name name;

  final Availability availability;

  final String shadow;

  final int price;

  final String catchPhrase;

  final String museumPhrase;

  final String imageUri;

  final String iconUri;

  const Fish({
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

  factory Fish.fromEntity(FishEntity entity) {
    return Fish(
      id: entity.id,
      fileName: entity.fileName,
      name: Name.fromEntity(entity.name),
      availability: Availability.fromEntity(entity.availability),
      shadow: entity.shadow,
      price: entity.price,
      catchPhrase: entity.catchPhrase,
      museumPhrase: entity.museumPhrase,
      imageUri: entity.imageUri,
      iconUri: entity.iconUri,
    );
  }
}
