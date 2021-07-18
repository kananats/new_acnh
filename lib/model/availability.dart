import 'package:flutter_template/constant/enum/hemisphere_enum.dart';
import 'package:flutter_template/data/database/entity/availability_entity.dart';

class Availability {
  final String monthNorthern;

  final String monthSouthern;

  final String location;

  final String rarity;

  final List<int> monthArrayNorthern;

  final List<int> monthArraySouthern;

  final List<int> timeArray;

  const Availability({
    required this.monthNorthern,
    required this.monthSouthern,
    required this.location,
    required this.rarity,
    required this.monthArrayNorthern,
    required this.monthArraySouthern,
    required this.timeArray,
  });

  factory Availability.fromEntity(AvailabilityEntity entity) {
    return Availability(
      monthNorthern: entity.monthNorthern,
      monthSouthern: entity.monthSouthern,
      location: entity.location,
      rarity: entity.rarity,
      monthArrayNorthern: entity.monthArrayNorthern,
      monthArraySouthern: entity.monthArraySouthern,
      timeArray: entity.timeArray,
    );
  }
}

extension AvailabilityExtension on Availability {
  bool get isAllYear {
    return monthArrayNorthern.length >= 12;
  }

  bool get isAllDay {
    return timeArray.length >= 24;
  }

  bool isAvailable(
    DateTime dateTime, {
    required HemisphereEnum hemisphere,
  }) {
    switch (hemisphere) {
      case HemisphereEnum.northern:
        return monthArrayNorthern.contains(dateTime.month) &&
            timeArray.contains(dateTime.hour);
      case HemisphereEnum.southern:
        return monthArraySouthern.contains(dateTime.month) &&
            timeArray.contains(dateTime.hour);
    }
  }
}
