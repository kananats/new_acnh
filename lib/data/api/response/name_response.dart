// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'name_response.g.dart';

@JsonSerializable()
class NameResponse {
  @JsonKey(name: "name-USen")
  final String USen;

  @JsonKey(name: "name-EUen")
  final String EUen;

  @JsonKey(name: "name-EUde")
  final String EUde;

  @JsonKey(name: "name-EUes")
  final String EUes;

  @JsonKey(name: "name-USes")
  final String USes;

  @JsonKey(name: "name-EUfr")
  final String EUfr;

  @JsonKey(name: "name-USfr")
  final String USfr;

  @JsonKey(name: "name-EUit")
  final String EUit;

  @JsonKey(name: "name-EUnl")
  final String EUnl;

  @JsonKey(name: "name-CNzh")
  final String CNzh;

  @JsonKey(name: "name-TWzh")
  final String TWzh;

  @JsonKey(name: "name-JPja")
  final String JPja;

  @JsonKey(name: "name-KRko")
  final String KRko;

  @JsonKey(name: "name-EUru")
  final String EUru;

  const NameResponse(
    this.USen,
    this.EUen,
    this.EUde,
    this.EUes,
    this.USes,
    this.EUfr,
    this.USfr,
    this.EUit,
    this.EUnl,
    this.CNzh,
    this.TWzh,
    this.JPja,
    this.KRko,
    this.EUru,
  );

  factory NameResponse.fromJson(Map<String, dynamic> json) =>
      _$NameResponseFromJson(json);
}
