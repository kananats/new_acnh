// ignore_for_file: non_constant_identifier_names

import 'package:flutter_template/data/database/entity/name_entity.dart';

class Name {
  final String USen;

  final String EUen;

  final String EUde;

  final String EUes;

  final String USes;

  final String EUfr;

  final String USfr;

  final String EUit;

  final String EUnl;

  final String CNzh;

  final String TWzh;

  final String JPja;

  final String KRko;

  final String EUru;

  const Name({
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

  factory Name.fromEntity(NameEntity entity) {
    return Name(
      USen: entity.USen,
      EUen: entity.EUen,
      EUde: entity.EUde,
      EUes: entity.EUes,
      USes: entity.USes,
      EUfr: entity.EUfr,
      USfr: entity.USfr,
      EUit: entity.EUit,
      EUnl: entity.EUnl,
      CNzh: entity.CNzh,
      TWzh: entity.TWzh,
      JPja: entity.JPja,
      KRko: entity.KRko,
      EUru: entity.EUru,
    );
  }
}
