import 'package:flutter_template/data/database/entity/availability_entity.dart';

class Availability {
  final String location;

  final String rarity;

  final List<int> monthArrayNorthern;

  final List<int> monthArraySouthern;

  final List<int> timeArray;

  const Availability({
    required this.location,
    required this.rarity,
    required this.monthArrayNorthern,
    required this.monthArraySouthern,
    required this.timeArray,
  });

  factory Availability.fromEntity(AvailabilityEntity entity) {
    return Availability(
      location: entity.location,
      rarity: entity.rarity,
      monthArrayNorthern: entity.monthArrayNorthern,
      monthArraySouthern: entity.monthArraySouthern,
      timeArray: entity.timeArray,
    );
  }
}
