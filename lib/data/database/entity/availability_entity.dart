import 'package:new_acnh/data/api/response/availability_response.dart';
import 'package:new_acnh/model/availability.dart';
import 'package:hive/hive.dart';

part 'availability_entity.g.dart';

@HiveType(typeId: 2)
class AvailabilityEntity extends HiveObject {
  @HiveField(0)
  final String monthNorthern;

  @HiveField(1)
  final String monthSouthern;

  @HiveField(2)
  final String location;

  @HiveField(3)
  final String rarity;

  @HiveField(4)
  final List<int> monthArrayNorthern;

  @HiveField(5)
  final List<int> monthArraySouthern;

  @HiveField(6)
  final List<int> timeArray;

  AvailabilityEntity({
    required this.monthNorthern,
    required this.monthSouthern,
    required this.location,
    required this.rarity,
    required this.monthArrayNorthern,
    required this.monthArraySouthern,
    required this.timeArray,
  });

  factory AvailabilityEntity.fromResponse(AvailabilityResponse response) {
    return AvailabilityEntity(
      monthNorthern: response.monthNorthern,
      monthSouthern: response.monthSouthern,
      location: response.location,
      rarity: response.rarity,
      monthArrayNorthern: response.monthArrayNorthern,
      monthArraySouthern: response.monthArraySouthern,
      timeArray: response.timeArray,
    );
  }

  factory AvailabilityEntity.fromModel(Availability model) {
    return AvailabilityEntity(
      monthNorthern: model.monthNorthern,
      monthSouthern: model.monthSouthern,
      location: model.location,
      rarity: model.rarity,
      monthArrayNorthern: model.monthArrayNorthern,
      monthArraySouthern: model.monthArraySouthern,
      timeArray: model.timeArray,
    );
  }
}
