import 'package:equatable/equatable.dart';
import 'package:new_acnh/data/database/entity/fish_entity.dart';
import 'package:new_acnh/model/availability.dart';
import 'package:new_acnh/model/name.dart';

class Fish extends Equatable {
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

  final bool isCaught;

  final bool isDonated;

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
    required this.isCaught,
    required this.isDonated,
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
      isCaught: entity.isCaught,
      isDonated: entity.isDonated,
    );
  }

  Fish copyWith({
    int? id,
    String? fileName,
    Name? name,
    Availability? availability,
    String? shadow,
    int? price,
    String? catchPhrase,
    String? museumPhrase,
    String? imageUri,
    String? iconUri,
    bool? isCaught,
    bool? isDonated,
  }) {
    return Fish(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      name: name ?? this.name,
      availability: availability ?? this.availability,
      shadow: shadow ?? this.shadow,
      price: price ?? this.price,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      museumPhrase: museumPhrase ?? this.museumPhrase,
      imageUri: imageUri ?? this.imageUri,
      iconUri: iconUri ?? this.iconUri,
      isCaught: isCaught ?? this.isCaught,
      isDonated: isDonated ?? this.isDonated,
    );
  }

  @override
  List<Object?> get props => [id, isCaught, isDonated];
}
