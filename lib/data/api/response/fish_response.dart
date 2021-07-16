import 'package:flutter_template/data/api/response/availability_response.dart';
import 'package:flutter_template/data/api/response/name_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fish_response.g.dart';

@JsonSerializable()
class FishResponse {
  final int id;

  @JsonKey(name: "file-name")
  final String fileName;

  final NameResponse name;
  final AvailabilityResponse availability;
  final String shadow;
  final int price;

  @JsonKey(name: "catch-phrase")
  final String catchPhrase;

  @JsonKey(name: "museum-phrase")
  final String museumPhrase;

  @JsonKey(name: "image_uri")
  final String imageUri;

  @JsonKey(name: "icon_uri")
  final String iconUri;

  const FishResponse(
    this.id,
    this.fileName,
    this.name,
    this.availability,
    this.shadow,
    this.price,
    this.catchPhrase,
    this.museumPhrase,
    this.imageUri,
    this.iconUri,
  );

  factory FishResponse.fromJson(Map<String, dynamic> json) =>
      _$FishResponseFromJson(json);
}
