// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FishResponse _$FishResponseFromJson(Map<String, dynamic> json) {
  return FishResponse(
    json['id'] as int,
    json['file-name'] as String,
    NameResponse.fromJson(json['name'] as Map<String, dynamic>),
    AvailabilityResponse.fromJson(json['availability'] as Map<String, dynamic>),
    json['shadow'] as String,
    json['price'] as int,
    json['catch-phrase'] as String,
    json['museum-phrase'] as String,
    json['image_uri'] as String,
    json['icon_uri'] as String,
  );
}

Map<String, dynamic> _$FishResponseToJson(FishResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file-name': instance.fileName,
      'name': instance.name,
      'availability': instance.availability,
      'shadow': instance.shadow,
      'price': instance.price,
      'catch-phrase': instance.catchPhrase,
      'museum-phrase': instance.museumPhrase,
      'image_uri': instance.imageUri,
      'icon_uri': instance.iconUri,
    };
