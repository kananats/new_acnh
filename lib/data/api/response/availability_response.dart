import 'package:json_annotation/json_annotation.dart';

part 'availability_response.g.dart';

@JsonSerializable()
class AvailabilityResponse {
  @JsonKey(name: "month-northern")
  final String monthNorthern;

  @JsonKey(name: "month-southern")
  final String monthSouthern;

  final String location;
  final String rarity;

  @JsonKey(name: "month-array-northern")
  final List<int> monthArrayNorthern;

  @JsonKey(name: "month-array-southern")
  final List<int> monthArraySouthern;

  @JsonKey(name: "time-array")
  final List<int> timeArray;

  const AvailabilityResponse(
    this.monthNorthern,
    this.monthSouthern,
    this.location,
    this.rarity,
    this.monthArrayNorthern,
    this.monthArraySouthern,
    this.timeArray,
  );

  factory AvailabilityResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityResponseFromJson(json);
}
