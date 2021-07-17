// ignore_for_file: non_constant_identifier_names

import 'package:flutter_template/data/api/response/name_response.dart';
import 'package:flutter_template/model/name.dart';
import 'package:hive/hive.dart';

part 'name_entity.g.dart';

@HiveType(typeId: 1)
class NameEntity extends HiveObject {
  @HiveField(0)
  final String USen;

  @HiveField(1)
  final String EUen;

  @HiveField(2)
  final String EUde;

  @HiveField(3)
  final String EUes;

  @HiveField(4)
  final String USes;

  @HiveField(5)
  final String EUfr;

  @HiveField(6)
  final String USfr;

  @HiveField(7)
  final String EUit;

  @HiveField(8)
  final String EUnl;

  @HiveField(9)
  final String CNzh;

  @HiveField(10)
  final String TWzh;

  @HiveField(11)
  final String JPja;

  @HiveField(12)
  final String KRko;

  @HiveField(13)
  final String EUru;

  NameEntity({
    required this.USen,
    required this.EUen,
    required this.EUde,
    required this.EUes,
    required this.USes,
    required this.EUfr,
    required this.USfr,
    required this.EUit,
    required this.EUnl,
    required this.CNzh,
    required this.TWzh,
    required this.JPja,
    required this.KRko,
    required this.EUru,
  });

  factory NameEntity.fromResponse(NameResponse response) {
    return NameEntity(
      USen: response.USen,
      EUen: response.EUen,
      EUde: response.EUde,
      EUes: response.EUes,
      USes: response.USes,
      EUfr: response.EUfr,
      USfr: response.USfr,
      EUit: response.EUit,
      EUnl: response.EUnl,
      CNzh: response.CNzh,
      TWzh: response.TWzh,
      JPja: response.JPja,
      KRko: response.KRko,
      EUru: response.EUru,
    );
  }

  factory NameEntity.fromModel(Name model) {
    return NameEntity(
      USen: model.USen,
      EUen: model.EUen,
      EUde: model.EUde,
      EUes: model.EUes,
      USes: model.USes,
      EUfr: model.EUfr,
      USfr: model.USfr,
      EUit: model.EUit,
      EUnl: model.EUnl,
      CNzh: model.CNzh,
      TWzh: model.TWzh,
      JPja: model.JPja,
      KRko: model.KRko,
      EUru: model.EUru,
    );
  }
}
