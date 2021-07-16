// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailabilityResponse _$AvailabilityResponseFromJson(Map<String, dynamic> json) {
  return AvailabilityResponse(
    json['month-northern'] as String,
    json['month-southern'] as String,
    json['location'] as String,
    json['rarity'] as String,
    (json['month-array-northern'] as List<dynamic>)
        .map((e) => e as int)
        .toList(),
    (json['month-array-southern'] as List<dynamic>)
        .map((e) => e as int)
        .toList(),
    (json['time-array'] as List<dynamic>).map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$AvailabilityResponseToJson(
        AvailabilityResponse instance) =>
    <String, dynamic>{
      'month-northern': instance.monthNorthern,
      'month-southern': instance.monthSouthern,
      'location': instance.location,
      'rarity': instance.rarity,
      'month-array-northern': instance.monthArrayNorthern,
      'month-array-southern': instance.monthArraySouthern,
      'time-array': instance.timeArray,
    };
